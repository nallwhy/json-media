defmodule JsonMedia.Blog do
  defmodule Post do
    defstruct [:title, :body]
  end

  def list_posts() do
    files = list_markdown_files()
    _posts = convert_to_post(files)
  end

  defp list_markdown_files() do
    posts_dir = posts_dir()

    File.ls!(posts_dir)
    |> Enum.filter(fn file -> String.ends_with?(file, ".md") end)
    |> Enum.map(fn file -> "#{posts_dir}/" <> file end)
  end

  defp convert_to_post(files) do
    files
    |> Enum.map(&get_file_content/1)
    |> Enum.map(&parse_to_post/1)
  end

  defp get_file_content(file) do
    File.read!(file)
  end

  defp parse_to_post(content) do
    [header, body] =
      content
      |> String.split("---", part: 2, trim: true)
      |> Enum.map(&String.trim/1)

    {term, _binding} = header |> Code.eval_string()

    title = term |> Keyword.get(:title)

    %Post{title: title, body: body}
  end

  defp posts_dir() do
    JsonMedia.Const.get()[:posts_dir]
  end
end

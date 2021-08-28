defmodule JsonMedia.Const do
  def get() do
    %{
      posts_dir: Application.app_dir(:json_media, "priv/posts")
    }
    |> Map.merge(
      case env() do
        :test ->
          %{
            posts_dir: "./test/support/fixture/posts"
          }

        _ ->
          %{}
      end
    )
  end

  defp env() do
    unquote(Mix.env())
  end
end

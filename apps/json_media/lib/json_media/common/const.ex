defmodule JsonMedia.Const do
  defp get() do
    %{
      posts_dir: Application.app_dir(:json_media, "priv/posts")
    }
    |> Map.merge(
      case Mix.env() do
        :test ->
          %{
            posts_dir: "./test/support/fixture/posts"
          }

        _ ->
          %{}
      end
    )
  end
end

defmodule JsonMedia.Const do
  @const %{
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

  def get() do
    @const
  end
end

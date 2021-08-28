defmodule JsonMediaWeb.Blog.PostController do
  use JsonMediaWeb, :controller
  alias JsonMedia.Blog

  def index(conn, _params) do
    posts = Blog.list_posts()

    conn
    |> render(%{posts: posts})
  end
end

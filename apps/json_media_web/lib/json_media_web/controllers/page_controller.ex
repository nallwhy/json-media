defmodule JsonMediaWeb.PageController do
  use JsonMediaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

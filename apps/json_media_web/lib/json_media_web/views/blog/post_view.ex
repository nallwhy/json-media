defmodule JsonMediaWeb.Blog.PostView do
  use JsonMediaWeb, :view
  alias JsonMedia.Markdown

  def to_html!(markdown) do
    raw(Markdown.to_html!(markdown))
  end
end

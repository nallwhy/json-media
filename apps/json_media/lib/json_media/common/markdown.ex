defmodule JsonMedia.Markdown do
  def to_html!(markdown) do
    markdown |> Earmark.as_html!()
  end
end

defmodule JsonMedia.BlogTest do
  use ExUnit.Case, async: true
  alias JsonMedia.Blog
  alias JsonMedia.Blog.Post

  describe "list_posts/0" do
    test "valid" do
      assert [%Post{title: "Test Post", body: "# Test Post"}] = Blog.list_posts()
    end
  end
end

defmodule BlogWeb.Homepage do
  use BlogWeb, :live_view

  alias Blog.Repo
  alias Blog.Posts.Post

  def mount(_params, _session, socket) do
    posts = Repo.all(Post) |> IO.inspect()
    {:ok, socket |> assign(posts: posts)}
  end

end

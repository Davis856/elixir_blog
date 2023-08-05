defmodule Blog.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        cover: "some cover",
        date: ~U[2023-08-04 14:29:00Z],
        slug: "some slug",
        subtitle: "some subtitle",
        title: "some title"
      })
      |> Blog.Posts.create_post()

    post
  end
end

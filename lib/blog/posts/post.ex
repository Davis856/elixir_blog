defmodule Blog.Posts.Post do
  alias Blog.Thumbnail
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset
  import Slugy

  alias Blog.Categories.Category

  schema "posts" do
    field :body, :string
    field :picture, Thumbnail.Type
    field :date, :utc_datetime
    field :slug, :string
    field :subtitle, :string
    field :title, :string

    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :subtitle, :body, :picture, :slug, :date, :category_id])
    |> validate_required([:title, :subtitle, :body, :picture, :slug, :date, :category_id])
    |> slugify(:title)
  end
end

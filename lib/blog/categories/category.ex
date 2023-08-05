defmodule Blog.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.Posts.Post

  schema "categories" do
    field :name, :string

    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end

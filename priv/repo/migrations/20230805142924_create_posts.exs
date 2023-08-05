defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :subtitle, :string
      add :body, :text
      add :cover, :string
      add :slug, :string
      add :date, :utc_datetime

      timestamps()
    end
  end
end

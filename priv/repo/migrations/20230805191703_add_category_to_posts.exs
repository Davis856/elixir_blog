defmodule Blog.Repo.Migrations.AddCategoryToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :category_id, references(:categories)
    end
  end
end

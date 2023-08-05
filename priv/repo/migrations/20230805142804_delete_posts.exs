defmodule Blog.Repo.Migrations.DeletePosts do
  use Ecto.Migration

  def change do
    drop table(:posts)
  end
end

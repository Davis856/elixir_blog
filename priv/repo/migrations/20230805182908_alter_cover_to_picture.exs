defmodule Blog.Repo.Migrations.AlterCoverToPicture do
  use Ecto.Migration

  def change do
    rename table(:posts), :cover, to: :picture
  end
end

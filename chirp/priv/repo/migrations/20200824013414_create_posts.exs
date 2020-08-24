defmodule Chirp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :body, :string
      add :like_counts, :integer
      add :reposts_count, :integer

      timestamps()
    end

  end
end

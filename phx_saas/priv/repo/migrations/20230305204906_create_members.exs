defmodule PhxSaas.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:members, [:account_id, :user_id])
  end
end

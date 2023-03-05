defmodule PhxSaas.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :personal, :boolean, default: false, null: false
      add :created_by_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:accounts, [:created_by_user_id])
  end
end

defmodule PhxSaas.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :name, :string
    field :personal, :boolean, default: false

    field :created_by_user_id, :id
    belongs_to :created_by, PhxSaas.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :personal])
    |> validate_required([:name, :personal])
    |> unique_constraint(:personal, name: :accounts_limit_personal_index)
  end
end

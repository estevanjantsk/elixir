defmodule PhxSaas.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do

    field :user_id, :id
    field :account_id, :id

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [])
    |> validate_required([])
  end
end

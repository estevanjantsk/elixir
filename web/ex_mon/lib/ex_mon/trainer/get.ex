defmodule ExMon.Trainer.Get do
  alias ExMon.{Repo,Trainer}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> fetch(uuid)
      :error -> {:error, "Invalid ID format!"}
    end
  end

  defp fetch(uuid) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> {:ok, trainer}
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end

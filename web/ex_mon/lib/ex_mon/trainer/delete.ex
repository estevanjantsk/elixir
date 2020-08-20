defmodule ExMon.Trainer.Delete do
  alias ExMon.{Repo,Trainer}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> delete(uuid)
      :error -> {:error, "Invalid ID format!"}
    end
  end

  defp delete(uuid) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end

defmodule ExMon do
  alias ExMon.{Trainer, Pokemon}

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call
  defdelegate fetch_trainer(id), to: Trainer.Get, as: :call

  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call
end

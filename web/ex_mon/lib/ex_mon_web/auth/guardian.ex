defmodule ExMonWeb.Auth.Guardian do
  use Guardian, otp_app: :my_app

  def subject_for_token(trainer, _claims) do
    sub = to_string(trainer.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMon.fetch_trainer()

    # resource = MyApp.get_resource_by_id(id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end

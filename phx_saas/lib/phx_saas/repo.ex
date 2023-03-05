defmodule PhxSaas.Repo do
  use Ecto.Repo,
    otp_app: :phx_saas,
    adapter: Ecto.Adapters.Postgres
end

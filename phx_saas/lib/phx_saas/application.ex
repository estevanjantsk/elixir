defmodule PhxSaas.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxSaasWeb.Telemetry,
      # Start the Ecto repository
      PhxSaas.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxSaas.PubSub},
      # Start Finch
      {Finch, name: PhxSaas.Finch},
      # Start the Endpoint (http/https)
      PhxSaasWeb.Endpoint
      # Start a worker by calling: PhxSaas.Worker.start_link(arg)
      # {PhxSaas.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxSaas.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxSaasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

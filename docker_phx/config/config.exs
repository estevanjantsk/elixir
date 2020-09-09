# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :docker_phx,
  ecto_repos: [DockerPhx.Repo]

# Configures the endpoint
config :docker_phx, DockerPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tYOMEDqVPrRP07DnkDwQy26iomue3fB7FVUvQfFA2wwH8VHc/ULm4/8wvcSLmSDX",
  render_errors: [view: DockerPhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DockerPhx.PubSub,
  live_view: [signing_salt: "aLBb20zy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

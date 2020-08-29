defmodule ExMonWeb.Router do
  use ExMonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExMonWeb do
    pipe_through :api

    resources "/trainers", TrainersController, only: [:create, :show, :delete, :update]

    resources "/trainer_pokemon", TrainerPokemonsController,
      only: [:create, :show, :delete, :update]

    get "/pokemons/:name", PokemonsController, :show
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ExMonWeb.Telemetry
    end
  end
end

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :woodies,
  ecto_repos: [Woodies.Repo]

# Configures the endpoint
config :woodies, WoodiesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pfYWCrSr8WlSevpKNbZbQ8yO4N5fiMM6ImWA5L9UsF4TEYjGXGRnLNQBmuc+M7lV",
  render_errors: [view: WoodiesWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Woodies.PubSub,
  live_view: [signing_salt: "F6GpLcz0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

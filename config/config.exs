# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixirqotd,
  ecto_repos: [Elixirqotd.Repo]

# Configures the endpoint
config :elixirqotd, ElixirqotdWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JP9Me4Fy1ygb6y/1xWs8md8lfU9SLeKGe9CjJ2ixGfkZ5nwUcBXXDurBiUwYJvCi",
  render_errors: [view: ElixirqotdWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elixirqotd.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

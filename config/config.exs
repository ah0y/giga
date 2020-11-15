# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :giga,
  ecto_repos: [Giga.Repo]

# Configures the endpoint
config :giga, GigaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YcAM2qPgrw4meblNWeq4hkceWMRMyIsOnr864woJ0ghruesJs/uJ9igSQMhnH1n+",
  render_errors: [view: GigaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Giga.PubSub,
  live_view: [signing_salt: "6W8Di51i"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  backends: [:console, Sentry.LoggerBackend]

config :sentry,
  dsn: "https://0a5adbddd8ff48c99d3a70ad48b71355@o476990.ingest.sentry.io/5517311",
  environment_name: Mix.env(),
  included_environments: [:prod],
  enable_source_code_context: true,
  root_source_code_paths: [File.cwd!()],
  tags: %{
    env: "production"
  },
  before_send_event: {Giga.Sentry, :before_send}

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

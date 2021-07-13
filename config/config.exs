# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :json_media,
  ecto_repos: [JsonMedia.Repo]

config :json_media_web,
  ecto_repos: [JsonMedia.Repo],
  generators: [context_app: :json_media]

# Configures the endpoint
config :json_media_web, JsonMediaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mbqFnsmVGv5NTJCkO0loNn8vdJz4TbbMESx8O5DdpAgDWBym2Ka3XKHXLIAAzCcP",
  render_errors: [view: JsonMediaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JsonMedia.PubSub,
  live_view: [signing_salt: "CuAHdwad"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

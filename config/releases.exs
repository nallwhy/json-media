import Config

config :json_media, JsonMedia.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10

config :json_media_web, JsonMediaWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  server: true

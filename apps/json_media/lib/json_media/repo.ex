defmodule JsonMedia.Repo do
  use Ecto.Repo,
    otp_app: :json_media,
    adapter: Ecto.Adapters.Postgres
end

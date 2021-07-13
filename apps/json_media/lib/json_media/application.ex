defmodule JsonMedia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      JsonMedia.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: JsonMedia.PubSub}
      # Start a worker by calling: JsonMedia.Worker.start_link(arg)
      # {JsonMedia.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: JsonMedia.Supervisor)
  end
end

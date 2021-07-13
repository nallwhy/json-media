defmodule JsonMediaWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      JsonMediaWeb.Telemetry,
      # Start the Endpoint (http/https)
      JsonMediaWeb.Endpoint
      # Start a worker by calling: JsonMediaWeb.Worker.start_link(arg)
      # {JsonMediaWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JsonMediaWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    JsonMediaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

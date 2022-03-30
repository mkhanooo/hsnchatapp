defmodule ChatProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ChatProject.Repo,
      # Start the Telemetry supervisor
      ChatProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChatProject.PubSub},
      # Start the Endpoint (http/https)
      ChatProjectWeb.Endpoint,
      # Start a worker by calling: ChatProject.Worker.start_link(arg)
      # {ChatProject.Worker, arg}
      ChatProjectWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

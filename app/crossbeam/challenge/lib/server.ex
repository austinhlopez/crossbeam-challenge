defmodule Server do
  use Application

  def start(_type, _args) do
    IO.inspect("application!")
    children = [
      { Plug.Adapters.Cowboy, scheme: :http, plug: Challenge.Router, options: [port: 8080]}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

defmodule Challenge.Mixfile do
  use Mix.Project

  def project do
    [app: :challenge,
     version: "0.0.1",
     elixir: "~> 1.1-dev",
     escript: [main_module: Challenge],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Server, []},
      applications: [:cowboy, :plug, :logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:httpoison, "~> 1.2"},
     {:poison, "~> 3.1"},
     {:cowboy, "~> 1.0"},
     {:plug, "~> 1.6.1"},
     {:basic_auth, "~> 2.2"}
    ]
  end
end

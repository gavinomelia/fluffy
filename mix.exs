defmodule Fluffy.Mixfile do
  use Mix.Project

  def project do
    [app: :fluffy,
     version: "0.0.2",
     elixir: "~> 1.0.2",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Fluffy, []},
     applications: [:phoenix, :cowboy, :logger, :httpoison]]
  end

  defp deps do
    [
      {:phoenix, "0.6.0"},
      {:httpoison, "~> 0.5"},
      {:json, "~> 0.3.2"},
      {:cowboy, "~> 1.0"}
    ]
  end
end

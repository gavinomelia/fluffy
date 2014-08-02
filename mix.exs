defmodule Fluffy.Mixfile do
  use Mix.Project

  def project do
    [ app: :fluffy,
      version: "0.0.1",
      elixir: "~> 0.14.3",
      elixirc_paths: ["lib", "web"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Fluffy, [] },
      applications: [:phoenix, :httpotion]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:phoenix, github: "phoenixframework/phoenix"},
      {:httpotion, github: "myfreeweb/httpotion"},
      {:json, github: "cblage/elixir-json"},
      {:cowboy, github: "extend/cowboy", optional: true}
    ]
  end
end

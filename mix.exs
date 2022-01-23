defmodule Bina.MixProject do
  use Mix.Project

  def project do
    [
      app: :bina,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: false,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      package: [
        name: :mix_bina,
        licenses: ["MIT"],
        description: "Find callers of functions in your Elixir project",
        source_url: "https://github.com/vinibrsl/mix_bina",
        homepage_url: "https://github.com/vinibrsl/mix_bina",
        links: %{"GitHub" => "https://github.com/vinibrsl/mix_bina"}
      ]
    ]
  end

  def application, do: []

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev, runtime: false}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end

defmodule Interval.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/tbug/elixir_interval"

  def project do
    [
      app: :interval,
      description: """
      Interval / range operations over any data type.
      """,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      test_coverage: test_coverage(),
      preferred_cli_env: [check: :test],
      deps: deps(),
      package: package(),
      aliases: aliases(),
      dialyzer: dialyzer()
    ] ++ docs()
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs() do
    [
      name: "Interval",
      source_url: @source_url,
      source_ref: "v#{@version}",
      # homepage_url: "https://github.com/tbug/interval_elixir",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp package() do
    [
      links: %{"GitHub" => @source_url},
      licenses: [
        "Apache-2.0"
      ]
    ]
  end

  defp test_coverage() do
    [
      summary: [threshold: 90]
    ]
  end

  defp aliases do
    [
      check: [
        "format --check-formatted",
        "credo suggest --all --format=oneline",
        "test --cover --slowest 5"
      ]
    ]
  end

  defp dialyzer do
    [
      flags: [:error_handling, :underspecs, :unmatched_returns, :no_return]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:stream_data, "~> 0.5", only: [:test, :dev], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.2", only: [:dev, :test], runtime: false}
    ]
  end
end

defmodule Bina.MixCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      import ExUnit.CaptureIO

      def in_mix_fixture(function, mix_path \\ "../../fixtures/fixture_project/") do
        capture_io(fn ->
          mix_path
          |> Path.expand(__DIR__)
          |> File.cd!(function)
        end)
      end
    end
  end
end

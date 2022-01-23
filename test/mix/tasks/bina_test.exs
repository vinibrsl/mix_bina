defmodule Mix.Tasks.BinaTest do
  use Bina.MixCase

  test "run/1 errors with invalid callees" do
    in_mix_fixture(fn ->
      assert_raise(RuntimeError, ~r/One or more callees are invalid/, fn ->
        Mix.Tasks.Bina.run(["Mod.fun/1", "Mod.fun/2", "Invalid/2"])
      end)
    end)
  end

  test "run/1 errors with no callees" do
    in_mix_fixture(fn ->
      assert_raise(RuntimeError, ~r/At least one callee must be provided/, fn ->
        Mix.Tasks.Bina.run([])
      end)
    end)
  end

  test "run/1 finds function calls" do
    log = in_mix_fixture(fn -> Mix.Tasks.Bina.run(["FixtureProject.one_arity_function/1"]) end)
    assert log =~ "Elixir.FixtureProject.one_arity_function/1 is called at"
  end
end

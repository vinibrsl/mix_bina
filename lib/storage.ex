defmodule Bina.Storage do
  @moduledoc false

  @table :bina_calls

  def new, do: :ets.new(@table, [:named_table, :public])

  def exists?(callee) do
    case :ets.lookup(@table, callee) do
      [_object] -> true
      _ -> false
    end
  end

  def insert(callee) do
    if valid_callee?(callee) do
      true = :ets.insert(@table, {"Elixir.#{callee}", true})
      :ok
    else
      {:error, :invalid_callee}
    end
  end

  @callee_regex ~r/^(.+)\.(.+)\/[0-9]+$/
  defp valid_callee?(callee) do
    Regex.match?(@callee_regex, callee)
  end
end

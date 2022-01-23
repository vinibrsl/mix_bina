defmodule Mix.Tasks.Bina do
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    with :ok <- load_callees(args),
         :ok <- Mix.Task.clear() do
      Mix.Task.run("compile", ["--force", "--tracer", Bina.Tracer])
    else
      {:error, :invalid_callee} ->
        raise """
        Failed to run task. One or more callees are invalid. Callees must have
        module name, function name, and arity in the following format:

          Module.function/arity

        For example:

          MyMod.fun/1
        """

      {:error, :invalid_args} ->
        raise """
        Failed to run task. At least one callee must be provided. For example:

          mix bina MyMod.fun/1
          mix bina MyMod.fun/1 OtherMod.fun/1
        """
    end
  end

  defp load_callees(callees) when is_list(callees) and length(callees) > 0 do
    Bina.Storage.new()

    Enum.reduce_while(callees, :ok, fn callee, acc ->
      case Bina.Storage.insert(callee) do
        :ok -> {:cont, acc}
        {:error, cause} = error -> {:halt, error}
      end
    end)
  end

  defp load_callees(_args), do: {:error, :invalid_args}
end

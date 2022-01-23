defmodule Bina.Tracer do
  def trace({:remote_function, meta, module, name, arity}, env) do
    function_name = "#{module}.#{name}/#{arity}"

    if Bina.Storage.exists?(function_name) do
      IO.puts("#{function_name} is called at #{env.file}:#{meta[:line]}")
    end

    :ok
  end

  def trace(_event, _env), do: :ok
end

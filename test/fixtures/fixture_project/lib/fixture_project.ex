defmodule FixtureProject do
  def zero_arity_function, do: nil
  def one_arity_function(_1), do: nil
  def two_arity_function(_1, _2), do: private_function()

  defp private_function, do: nil
end

defmodule FixtureProject.Foo do
  FixtureProject.zero_arity_function()
end

defmodule FixtureProject.Bar do
  def bar do
    FixtureProject.one_arity_function(nil)
  end
end

defmodule FixtureProject.Baz do
  def baz do
    fn -> FixtureProject.two_arity_function(nil, nil) end
  end
end

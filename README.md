# mix_bina
Bina helps you to list all callers of a function inside your Elixir project.
This is useful while debugging or refactoring. For example:

```
$ mix bina MyModule.my_fun/1

MyModule.my_fun/1 is called at file_1.ex
MyModule.my_fun/1 is called at file_2.ex
MyModule.my_fun/1 is called at file_3.ex
```

Bina uses compilation tracers, which allows modules to observe constructs handled
by the Elixir compiler when compiling files.

## Installation and Usage
The easiest way to add Bina to your project is by using Mix. Add `:mix_bina` as
a dev dependency to your project's `mix.exs`:

```elixir
defp deps do
  [
    {:mix_bina, "~> 0.1", only: [:dev], runtime: false}
  ]
end
```

And run:

```
$ mix bina MyModule.my_fun/1
```

## Why is it called Bina?
In Portuguese, "bina" is the caller ID phone feature. Bina is actually the
abbreviation for "**B** **i**dentifies **n**umber of **A**".

## License
Bina is released under the MIT License. See the LICENSE file for further details.

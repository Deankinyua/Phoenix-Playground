defmodule PhoenixPlayground.Salutator do

  def run do
    receive do
      {:hi, name} ->
        IO.puts("Hi, #{name}")

      {_, name} ->
        IO.puts("Hello, #{name}")
    end

    run()
  end
end

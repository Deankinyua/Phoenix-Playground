defmodule PhoenixPlaygroundWeb.NumberCompare do
  @moduledoc """
  shows how numbers compare
  """
  use PhoenixPlaygroundWeb, :controller

  def greater(number, other_number) when number >= other_number, do: number
  def greater(_, other_number), do: other_number

  def total_cost(price, tax_rate) when price >= 0 and tax_rate >= 0 do
    price * (tax_rate + 1)
  end

  def get_in_club(age) when age > 0 do
    cond do
      age >= 18 -> IO.puts("Get in Motherfucker!!")
      age < 18 -> IO.puts("Go home to your family")
    end
  end

  def string_checker(value) do
    if String.valid?(value) do
      "Valid string!"
    else
      "Invalid string."
    end
  end

  def integer_checker(value) do
    if is_integer(value) do
      "An Integer"
    else
      "Not an Integer"
    end
  end

  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts("Time: #{time} μs")
    IO.puts("Result: #{result}")
  end
end

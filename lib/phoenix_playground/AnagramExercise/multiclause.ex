defmodule PhoenixPlayground.Multiclause do
  # note: Multiclause Functions
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)

  def is_list_empty?([]), do: true
  def is_list_empty?([_ | _]), do: false

  # * This is an Overloaded multiclause function which uses
  # * pattern matching to find the area of different shapes
  # *  A clause is a function definition specified by the def expression.

  def calc_area({:rectangle, a, b}) do
    a * b
  end

  def calc_area({:circle, a}) do
    a * a * 3.14
  end

  def calc_area({:square, a}) do
    a * a
  end

  # * Place the case that always matches last so the runtime is not confused

  def calc_area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end

  # * Branching with MultiClause Functions
  # * Branch based on the shape of the input data

  # * behaves differently when called with a binary or a number and uses Guard Expressions
  # * Did you know a bitstring is a binary if the number of bits is strictly divisible by 8?

  def double(x) when is_number(x), do: x * 2
  def double(x) when is_binary(x), do: x <> x

  def ret_atom(num) when is_number(num) and num < 0 do
    :negative
  end

  def ret_atom(num) when num === 0 do
    :zero
  end

  def ret_atom(num) when is_number(num) do
    :positive
  end

  # * Implementing MultiClause Lambdas (Anonymous Functions)

  def multiclause_lambda(x) do
    test_num =
      fn
        x when is_number(x) and x < 0 -> :negative
        x when x == 0 -> :zero
        x when is_number(x) and x > 0 -> :positive
      end

    test_num.(x)
  end

  # * Returns the minimal element in the enumerable according to Erlang's term ordering.
  def smallest(list) when length(list) > 0 do
    Enum.min(list)
  end

  def smallest(_), do: {:error, :invalid_argument}
end

defmodule PhoenixPlayground.Sender do
  alias PhoenixPlayground.Receiver

  def send_message do
    pid = Receiver.get_pid()
    send(pid, {self(), "some_message"})
  end

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

  def ret_atom(num) when is_number(num) and num < 0 do
    :negative
  end

  def ret_atom(num) when num === 0 do
    :zero
  end

  def ret_atom(num) when is_number(num) do
    :positive
  end

  def smallest(list) when length(list) > 0 do
    Enum.min(list)
  end

  def smallest(_), do: {:error, :invalid_argument}

  # * The function determines if the bread has expired or not

  def isExpired(current_date, expiry_date) do
    cond do
      Date.compare(current_date, expiry_date) == :gt -> "The bread has expired"
      Date.compare(current_date, expiry_date) == :lt -> "The bread is okay for consumption"
    end
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
end

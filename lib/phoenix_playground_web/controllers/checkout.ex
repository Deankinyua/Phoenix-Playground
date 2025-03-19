defmodule PhoenixPlaygroundWeb.Checkout do
  @moduledoc """
  Checkout Controller
  """
  use PhoenixPlaygroundWeb, :controller

  def total_cost(price, tax_rate) do
    price * (tax_rate + 1)
  end

  def velocity_calc(distance, time) do
    average_velocity = distance / time

    IO.puts(
      "His average velocity is #{average_velocity} km/hr. He travelled #{distance} km in #{time} hrs."
    )
  end

  def boxes(stick_num) do
    big = div(stick_num, 50)
    medium = div(rem(stick_num, 50), 20)
    small = div(rem(rem(stick_num, 50), 20), 5)
    rem = rem(rem(rem(stick_num, 50), 20), 5)

    %{big: big, medium: medium, remaining_matchsticks: rem, small: small}
  end
end

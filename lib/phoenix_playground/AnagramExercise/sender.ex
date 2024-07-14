defmodule PhoenixPlayground.Sender do
  alias PhoenixPlayground.Receiver

  def send_message do
    pid = Receiver.get_pid()
    send(pid, {self(), "some_message"})
  end

  # * This is a multiclause function which uses pattern matching to find the area of different shapes
  def calc_area({:rectangle, a, b}) do
    a * b
  end

  def calc_area({:circle, a}) do
    a * a * 3.14
  end

  def calc_area({:square, a}) do
    a * a
  end
end

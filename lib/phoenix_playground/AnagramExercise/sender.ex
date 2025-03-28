defmodule PhoenixPlayground.Sender do
  alias PhoenixPlayground.Receiver

  def send_message do
    pid = Receiver.get_pid()
    send(pid, {self(), 10})
  end

  # * The function determines if the bread has expired or not

  def expired?(current_date, expiry_date) do
    cond do
      Date.compare(current_date, expiry_date) == :gt -> "The bread has expired"
      Date.compare(current_date, expiry_date) == :lt -> "The bread is okay for consumption"
    end
  end
end

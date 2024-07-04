defmodule PhoenixPlayground.Sender do
  alias PhoenixPlayground.Receiver

  def send_message do
    pid = Receiver.get_pid()
    send(pid, {self(), "some_message"})
  end
end

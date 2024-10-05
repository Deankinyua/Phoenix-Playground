defmodule PhoenixPlayground.Receiver1 do
  @moduledoc """

  receives the message from PhoenixPlaygroundSender Module
  """

  def get_pid do
    self()
  end

  def receive_message do
    receive do
      {caller_pid, message} ->
        # IO.puts(is_bitstring(message))
        response = "The message from sender module has been received"
        send(caller_pid, {:response, response})
        message
    end
  end
end

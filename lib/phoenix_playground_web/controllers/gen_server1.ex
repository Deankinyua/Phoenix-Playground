defmodule GenServer1 do
  # use PhoenixPlaygroundWeb, :controller
  @behaviour GenServer
  @impl true
  def init(init_arg), do: {:ok, init_arg}
  # def init(_init_arg), do: Process.sleep(2000)
end
# GenServer.start(GenServer1, [], name: GenServer1)
# GenServer.start(GenServer1, [], timeout: 1000)
# GenServer.stop(GenServer1)
# Process.whereis(GenServer1)

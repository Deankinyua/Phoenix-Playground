defmodule PhoenixPlayground.GenServer1 do
  # use PhoenixPlaygroundWeb, :controller
  @behaviour GenServer
  @impl true
  # def init(init_arg), do: {:ok, init_arg}
  # def init(init_arg), do: {:ok, init_arg, 5000}
  def init(init_arg), do: {:ok, init_arg, :hibernate}
  @impl true
  def handle_info(:timeout, state) do
    IO.puts("timeout called")
    {:noreply, state}
  end
end

# GenServer.start(GenServer1, [], name: GenServer1)
# GenServer.start(GenServer1, [], timeout: 1000)
# GenServer.stop(GenServer1)
# Process.whereis(GenServer1)

# def init(_init_arg), do: Process.sleep(2000)
# {:ok, server_pid} = GenServer.start(GenServer1, [])
# * reduced heap and stack size due to hibernation - GC
# Process.info(server_pid, :heap_size)

# Process.info(server_pid, :stack_size)

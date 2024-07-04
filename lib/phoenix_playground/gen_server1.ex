defmodule PhoenixPlayground.GenServer1 do
  @behaviour GenServer
  @impl true
  def init(_init_arg), do: {:ok, []}
  @impl true
  def handle_call({:add, el}, _from, current_state) do
    new_state = [el | current_state]
    {:reply, new_state, new_state}
  end
  # @behaviour GenServer
  # @impl true
  # def init(init_arg), do: {:ok, init_arg}
  # @impl true
  # def handle_call(:test, from, state) do
  #   IO.inspect(from, label: "from")
  #   Process.sleep(2000)
  #   date = Timex.local()
  #   {:reply, date, state}
  # end
  # @impl true
  # def handle_info(:timeout, state) do
  #   IO.puts("timeout called")
  #   {:noreply, state}
  # end
end

#* Use "GenServer.call(GenServer1, :test)" to initiate a synchronous call to a GenServer process.

#* Use "GenServer.start(GenServer1, [], name: GenServer1)" to start the genserver
# GenServer.start(GenServer1, [], timeout: 1000)
# GenServer.stop(GenServer1)
# Process.whereis(GenServer1)

# def init(_init_arg), do: Process.sleep(2000)
# {:ok, server_pid} = GenServer.start(GenServer1, [])
# * reduced heap and stack size due to hibernation - GC
# Process.info(server_pid, :heap_size)

# Process.info(server_pid, :stack_size)

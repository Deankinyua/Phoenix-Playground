defmodule PhoenixPlaygroundWeb.ClockLive do
  @moduledoc false
  use Timex
  # use Process
  import DateTime
  alias PhoenixPlaygroundWeb.NumAddLive
  use PhoenixPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    socket
    |> assign_now_and_schedule_next_tick()
    |> then(&{:ok, &1})
  end

  def render(assigns) do
    ~H"""
    <div id="my-silly-clock" class="text-xl p-8 rounded-full border border-2 text-center">
      <%= @now %>
    </div>
    """
  end

  def handle_info(:tick, socket) do
    socket
    |> assign_now_and_schedule_next_tick()
    |> then(&{:noreply, &1})
  end

  defp assign_now_and_schedule_next_tick(socket) do
    now = to_time(Timex.local())

    socket
    |> assign(:now, now)
    |> tap(&schedule_tick/1)
  end

  defp schedule_tick(socket) do
    Process.send_after(self(), :tick, 1_000)
  end

  # * This function was when I was revising on the use of specifications

  # * @spec directive placed right before the function definition and taking as a params the name of the
  # * function, a list of parameter types, and after :: the type of the return value.
  @spec sum_product(integer) :: integer
  def sum_product(a) do
    [1, 2, 3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
  end

  def get_pid do
    self()
  end

  def message_receiver do
    receive do
      message ->
        IO.puts(message)
        IO.puts("Hello I received the message from clock live module")
    after
      0 ->
        IO.puts("Message not found")
    end
  end

  def send_message do
    pid = NumAddLive.get_pid()
    date = Timex.local()

    Process.send_after(pid, date, 2000)
  end
end

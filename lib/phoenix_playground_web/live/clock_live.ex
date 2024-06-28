defmodule PhoenixPlaygroundWeb.ClockLive do
  @moduledoc false
  use Timex
  import DateTime
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
end

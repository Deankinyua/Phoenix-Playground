defmodule PhoenixPlaygroundWeb.NumAddLive do
  use PhoenixPlaygroundWeb, :live_view

  def render(assigns) do
    ~H"""
    <h2>Perfoming an Addition, Showing it and IO.puts to the console</h2>
    <p><%= @number %></p>
    <div>
      <button phx-click="perform_addition" phx-value-number={@number}>Add</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        number: 1
      )

    {:ok, socket}
  end

  def handle_event("perform_addition", %{"number" => number}, socket) do
    # add = fn num -> num + 1 end
    number = String.to_integer(number)
    add = &(&1 + 1)
    IO.puts(add.(number))

    {:noreply, assign(socket, number: add.(number))}
  end
end

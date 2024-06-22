defmodule PhoenixPlaygroundWeb.NumAddLive do
  use PhoenixPlaygroundWeb, :live_view

  def render(assigns) do
    ~H"""
    <h2>Perfoming an Addition, Showing it and IO.puts to the console</h2>
    <p><%= @number %></p>
    <p><%= @date %></p>
    <div>
      <button phx-click="perform_addition" phx-value-number={@number}>Add</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        number: 2,
        date: DateTime.utc_now()
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

defmodule PhoenixPlaygroundWeb.StringList do
  def upcase([]), do: []
  def upcase([first | rest]), do: [String.upcase(first) | upcase(rest)]

  def anonymous(a, b) do
    sum = a + b
    IO.puts(sum)
  end



  # We can share values with functions using closures. A closure has access to variable
# values both inside and outside of the code block. In Elixir we can create an anonymous
# function and pass it a code block with the values of the variables that were defined
# outside of it.
# e.g

# message = "Hello, World!"
#  say_hello = fn -> Process.sleep(1000); IO.puts(message) end
# spawn(say_hello)
# "Hello, World!"




end

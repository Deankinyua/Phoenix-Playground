defmodule PhoenixPlaygroundWeb.NumAddLive do
      @moduledoc """
  this module is used for performing an addition, logging it to the console

  ## Examples

  IO.puts(add.(number))


  """
  use Timex
  alias PhoenixPlaygroundWeb.NumAddLive
  import DateTime
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
    {:ok,
     socket
     |> assign(:number, 0)
     |> assign(:date, to_time(Timex.local()))}

    #  |> assign(:date, get_pid())}
  end

  def handle_event("perform_addition", %{"number" => number}, socket) do
    # add = fn num -> num + 1 end
    number = String.to_integer(number)
    add = &(&1 + 1)
    IO.puts(add.(number))

    {:noreply,
     socket
     |> assign(number: add.(number))}
  end

  def get_pid do
    self()
    # spawn(fn -> IO.puts "Hello, World!" end)
    # date_struct = Timex.local()
    # spawn(NumAddLive, :date_adder, [date_struct])
  end

  # def handle_params(_params, _url, socket) do
  #   {:noreply, assign(socket, date: to_time(date_adder(Timex.local())))}
  # end
  def date_adder(date_struct) do
    date_struct = add(date_struct, 1, :second)
    # IO.puts(date_struct)
    # date_adder(date_struct)
  end

  def message_receiver do
    receive do
      date -> IO.puts(date)
        IO.puts("Hello I received the message from clock live module")
    after
      0 ->
        IO.puts("Message not found")
    end
  end
end

defmodule PhoenixPlaygroundWeb.StringList do
  def upcase([]), do: []
  def upcase([first | rest]), do: [String.upcase(first) | upcase(rest)]

  def anonymous(a, b) do
    sum = a + b
    IO.puts(sum)

    local_anonymous = fn ->
      d = 10
      multiply = d + 20
      multiply
    end

    IO.puts(local_anonymous.())
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

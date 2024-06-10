defmodule PhoenixPlayground.MySet do
  @enforce_keys [:age]
  defstruct name: "John Doe", age: 35

  #  if you require to update an undefined key in a struct, the Map module functions, put/3, update/4 etc can be used.

  def push(set = %{items: items}, item) do
    if Enum.member?(items, item) do
      set
    else
      %{set | items: items ++ [item]}
    end
  end

  def log(name) do
    IO.puts(name)
  end
end

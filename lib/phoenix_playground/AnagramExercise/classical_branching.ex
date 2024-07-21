defmodule PhoenixPlayground.ClassicalBranching do
  @spec call_status(any()) :: :ended | :pending | :started
  def call_status(call) do
    # * Use a map to store the call. Maps in elixir can be compared to objects in oop languages
    # * E.G call = %{started_at: nil, ended_at: nil}
    cond do
      call.ended_at != nil -> :ended
      call.started_at != nil -> :started
      # 1
      # * Since the condition of this clause
      # * (true) is always satisfied, this effectively becomes the fallback clause that is
      # * invoked if none of the previously stated conditions in the cond expression are met.
      true -> :pending
    end
  end

  def max(a, b) do
    case a >= b do
      true -> "correct"
      false -> "incorrect"
    end
  end
end

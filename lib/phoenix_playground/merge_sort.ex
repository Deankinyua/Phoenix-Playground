defmodule PhoenixPlayground.MergeSort do
  @moduledoc """
  Mergesort
  """

  def merge_sort([]), do: []
  def merge_sort([a]), do: [a]

  def merge_sort(list) do
    {left, right} = split(list)
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)
    merge(sorted_left, sorted_right)
  end

  # Helper: Split list into halves
  defp split(list) do
    mid = div(length(list), 2)
    Enum.split(list, mid)
  end

  # Helper: Merge two sorted lists
  defp merge([], right), do: right
  defp merge(left, []), do: left

  defp merge([h1 | t1], [h2 | t2]) do
    if h1 <= h2 do
      [h1 | merge(t1, [h2 | t2])]
    else
      [h2 | merge([h1 | t1], t2)]
    end
  end
end

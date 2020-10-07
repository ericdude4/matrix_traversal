defmodule Matrix do
  @moduledoc """
  Documentation for `Matrix`.
  """

  @doc """
  Traverse.

  ## Examples

      iex> Matrix.traverse(5)

  """
  def traverse(size) when is_integer(size) and size == 1 do
    IO.puts("(#{1}, #{1})")
  end

  def traverse(size) when is_integer(size) and size > 0 do
    do_traverse(size - 1, 0, 0, 0)
  end

  defp do_traverse(0, _x, _y, _zero), do: nil

  # Exit case for odd dimensioned matrices
  defp do_traverse(n, x, y, zero) when n == x and x == y and y == zero do
    IO.write("(#{x}, #{y}), finish")
  end

  # Exit case for even dimensioned matrices
  defp do_traverse(n, x, y, zero) when n + 1 == x and x == y and y == zero do
    IO.puts("finish")
  end

  defp do_traverse(n, x, y, zero) when y == n and x > zero do
    IO.write("(#{x}, #{y}), ")
    do_traverse(n, x - 1, y, zero)
  end

  defp do_traverse(n, x, y, zero) when x == zero and y > zero do
    IO.write("(#{x}, #{y}), ")
    if x == zero and y - 1 == zero do
      # finish lap
      do_traverse(n - 1, x + 1, y, zero + 1)
    else
      do_traverse(n, x, y - 1, zero)
    end
  end

  defp do_traverse(n, x, y, zero) when x == n and y < n do
    IO.write("(#{x}, #{y}), ")
    do_traverse(n, x, y + 1, zero)
  end

  defp do_traverse(n, x, y, zero) when x < n and y < n do
    IO.write("(#{x}, #{y}), ")
    do_traverse(n, x + 1, y, zero)
  end

  # defp do_traverse(n, x, y, zero) when x == zero and y == zero do
  #   IO.puts("finish lap (#{x}, #{y}) #{n} #{zero}")
  #   do_traverse(n - 2, x + 1, y + 1, zero + 1)
  # end

  # defp do_traverse(n, x, y, zero) do
  #   # Print the current coordinate
  #   IO.puts("(#{x}, #{y}) #{n} #{zero}")
  #   # Continue to next coordinate

  #   # x = 0
  #   # y = 3
  #   # n = 4
  #   # zero = 0
  #   cond do
  #     y == n && x > zero ->
  #       IO.puts("three")
  #       # bottom right to bottom left
  #       do_traverse(n, x - 1, y, zero)

  #     x == zero && y > zero ->
  #       IO.puts("four")
  #       # bottom left to top left
  #       do_traverse(n, x, y - 1, zero)

  #     x < n && y < n ->
  #       # top left to top right
  #       IO.puts("one")
  #       do_traverse(n, x + 1, y, zero)

  #     x == n && y < n ->
  #       IO.puts("two")
  #       # top right to bottom right
  #       do_traverse(n, x, y + 1, zero)

  #     true ->
  #       IO.puts("shouldn't be here")
  #   end
  # end
end

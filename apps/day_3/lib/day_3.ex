defmodule Day3 do
  def part_1(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&part_1_triangle?/1)
    |> Enum.count(&(&1))
    |> IO.puts
  end

  def part_1_triangle?(line) do
    line
    |> String.strip()
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
    |> possible_triangle?()
  end

  def possible_triangle?([a, b, c]), do: a + b > c
end

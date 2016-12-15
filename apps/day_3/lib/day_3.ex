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



  def part_2(filename) do
    filename
    |> File.read!()
    |> String.split("\r\n")
    |> parse_columns([])
    |> Enum.map(&part_2_triangle?/1)
    |> Enum.count(&(&1))
    |> IO.puts
  end

  def part_2_triangle?(line) do
    line
    |> Enum.sort()
    |> possible_triangle?()
  end

  def parse_columns([], acc), do: acc
  def parse_columns(file_contents, acc) do
    parsed_triangles = file_contents
    |> Enum.take(3)
    |> Enum.map(&String.trim/1)
    |> parse_triangles()
    parse_columns(Enum.drop(file_contents, 3), acc++parsed_triangles)
  end

  def parse_triangles([row_one, row_two, row_three]) do
    [a1, a2, a3] = String.split(row_one, " ", trim: true)
    |> Enum.map(&String.to_integer/1)
    [b1, b2, b3] = String.split(row_two, " ", trim: true)
    |> Enum.map(&String.to_integer/1)
    [c1, c2, c3] = String.split(row_three, " ", trim: true)
    |> Enum.map(&String.to_integer/1)
    [[a1, b1, c1],
      [a2, b2, c2],
      [a3, b3, c3]]
  end
end

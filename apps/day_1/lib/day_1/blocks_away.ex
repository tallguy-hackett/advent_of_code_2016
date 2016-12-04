defmodule Day1.BlocksAway do
  def blocks_away_from_file(filename) do
    File.read!(filename)
    |> blocks_away
    |> IO.puts
  end

  def blocks_away(directions) do
    directions
    |> String.replace(" ", "")
    |> String.strip()
    |> String.split(",", trim: true)
    |> Enum.reduce({0, 0, :north}, &blocks_away/2)
    |> _calculate_blocks
  end

  def blocks_away("R"<>num_spaces, {x, y, :north}) do
    {x+String.to_integer(num_spaces), y, :east}
  end
  def blocks_away("L"<>num_spaces, {x, y, :north}) do
    {x-String.to_integer(num_spaces), y, :west}
  end
  def blocks_away("R"<>num_spaces, {x, y, :south}) do
    {x-String.to_integer(num_spaces), y, :west}
  end
  def blocks_away("L"<>num_spaces, {x, y, :south}) do
    {x+String.to_integer(num_spaces), y, :east}
  end
  def blocks_away("R"<>num_spaces, {x, y, :east}) do
    {x, y-String.to_integer(num_spaces), :south}
  end
  def blocks_away("L"<>num_spaces, {x, y, :east}) do
    {x, y+String.to_integer(num_spaces), :north}
  end
  def blocks_away("R"<>num_spaces, {x, y, :west}) do
    {x, y+String.to_integer(num_spaces), :north}
  end
  def blocks_away("L"<>num_spaces, {x, y, :west}) do
    {x, y-String.to_integer(num_spaces), :south}
  end

  defp _calculate_blocks({x, y, _compass_direction}), do: abs(x) + abs(y)

end
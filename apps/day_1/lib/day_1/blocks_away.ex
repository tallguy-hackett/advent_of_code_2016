defmodule Day1.BlocksAway do
  def blocks_away(directions) do
    directions
    |> String.replace(" ", "")
    |> String.split(",", trim: true)
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

end
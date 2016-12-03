defmodule BlocksAwayTest do
  use ExUnit.Case
  doctest Day1

  import Day1.BlocksAway

  test "{3, 0, :east} returned when passing 'R3' from origin facing north" do
    assert blocks_away("R3", {0, 0, :north}) == {3, 0, :east}
  end

  test "{-3, 0, :west} returned when passing 'L3' from origin facing north" do
    assert blocks_away("L3", {0, 0, :north}) == {-3, 0, :west}
  end

  test "{-3, 0, :west} returned when passing 'R3' from origin facing north" do
    assert blocks_away("R3", {0, 0, :south}) == {-3, 0, :west}
  end

  test "{3, 0, :east} returned when passing 'L3' from origin facing north" do
    assert blocks_away("L3", {0, 0, :south}) == {3, 0, :east}
  end

  test "{0, -3, :south}, returned when passing 'R3' from origin facing east" do
    assert blocks_away("R3", {0, 0, :east}) == {0, -3, :south}
  end

  test "{0, 3, :north}, returned when passing 'L3' from origin facing east" do
    assert blocks_away("L3", {0, 0, :east}) == {0, 3, :north}
  end

  test "{0, 3, :north}, returned when passing 'R3' from origin facing east" do
    assert blocks_away("R3", {0, 0, :west}) == {0, 3, :north}
  end

  test "{0, -3, :south}, returned when passing 'L3' from origin facing east" do
    assert blocks_away("L3", {0, 0, :west}) == {0, -3, :south}
  end

  test "['L1', 'R1']returned when passing 'L1, R1'" do
    assert blocks_away("L1, R1") == ["L1", "R1"]
  end
end
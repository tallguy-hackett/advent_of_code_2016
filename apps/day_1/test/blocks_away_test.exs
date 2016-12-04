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

  test "2 returned when passing 'L1, R1'" do
    assert blocks_away("L1, R1") == 2
  end

  test "5 returned when passing 'R2, L3'" do
    assert blocks_away("R2, L3") == 5
  end

  test "2 returned when passing 'R2, R2, R2'" do
    assert blocks_away("R2, R2, R2") == 2
  end

  test "12 returned when passing 'R5, L5, R5, R3'" do
    assert blocks_away("R5, L5, R5, R3") == 12
  end
end
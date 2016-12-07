defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "part_1_triangle? returns false for ' 5  10  25'" do
    assert Day3.part_1_triangle?(" 5  10  25") == false
  end

  test "part_1_triangle? returns false for ' 25  10   5'" do
    assert Day3.part_1_triangle?(" 25  10   5") == false
  end

  test "possible_triangle? returns false for [5, 10, 25]" do
    assert Day3.possible_triangle?([5,10,25]) == false
  end

  test "possible_triangle? returns true for [5, 10, 14]" do
    assert Day3.possible_triangle?([5,10,14]) == true
  end
end

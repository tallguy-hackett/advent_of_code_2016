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

  test "parse_columns returns [[1,1,1],[2,2,2],[3,3,3]] for ['1 2 3', '1 2 3 ', '1 2 3']" do
    assert Day3.parse_columns(["1 2 3", "1 2 3 ", "1 2 3"], []) == [[1,1,1],[2,2,2],[3,3,3]]
  end

  test "parse_columns returns [[1,1,1],[2,2,2],[3,3,3]] for ['101 301 501','102 302 502','103 303 503','201 401 601','202 402 602','203 403 603']" do
    assert Day3.parse_columns(["101 301 501","102 302 502","103 303 503","201 401 601","202 402 602","203 403 603"], []) == [[101,102,103],[301,302,303],[501,502,503],[201,202,203],[401,402,403],[601,602,603]]
  end
end

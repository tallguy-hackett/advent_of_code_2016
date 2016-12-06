defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  @tag :skip
  test "blocks_away returns 4 when given 'R8, R4, R4, R8'" do
    assert Day1.blocks_away("R8, R4, R4, R8") == 4
  end

  test "blocks_away returns a stripped, split list" do
    assert Day1.blocks_away("R1, R2, R3\r\n") == [{-2, -2, :west},
                                                  {-1, -2, :west},
                                                  {0, -2, :west},
                                                  {1, -2, :south},
                                                  {1, -1, :south},
                                                  {1, 0, :east},
                                                  {0, 0, :north}]
  end

  test "blocks_away returns the path traveled starting facing north" do
    assert Day1.blocks_away("R3", [{0, 0, :north}]) == [{3, 0, :east},
                                                        {2, 0, :east},
                                                        {1, 0, :east},
                                                        {0, 0, :north}]
  end

  test "blocks_away returns the path traveled started facing south" do
    assert Day1.blocks_away("R3", [{0, 0, :south}]) == [{-3, 0, :west},
                                                        {-2, 0, :west},
                                                        {-1, 0, :west},
                                                        {0, 0, :south}]
  end

  test "blocks_away returns the path traveled started facing east" do
    assert Day1.blocks_away("R3", [{0, 0, :east}]) == [{0, -3, :south},
                                                        {0, -2, :south},
                                                        {0, -1, :south},
                                                        {0, 0, :east}]
  end

  test "blocks_away returns the path traveled started facing west" do
    assert Day1.blocks_away("R3", [{0, 0, :west}]) == [{0, 3, :north},
                                                        {0, 2, :north},
                                                        {0, 1, :north},
                                                        {0, 0, :west}]
  end
end

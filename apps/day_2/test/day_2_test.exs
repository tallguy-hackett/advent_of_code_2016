defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "button 2 is returned for 'U'" do
    assert Day2.move("U", 5) == 2
  end

  test "button 2 is returned for 'UU'" do
    assert Day2.move("UU", 5) == 2
  end

  test "button 8 is returned for 'D'" do
    assert Day2.move("D") == 8
  end

  test "button 8 is returned for 'DD'" do
    assert Day2.move("DD") == 8
  end

  test "button 5 is returned for 'DU'" do
    assert Day2.move("DU") == 5
  end

  test "button 8 is returned for 'DUD'" do
    assert Day2.move("DUD") == 8
  end

  test "button 8 is returned for 'DUDD'" do
    assert Day2.move("DUDD") == 8
  end

  test "button 4 is returned for 'L'" do
    assert Day2.move("L") == 4
  end

  test "button 4 is returned for 'LL'" do
    assert Day2.move("LL") == 4
  end

  test "button 6 is returned for 'R'" do
    assert Day2.move("R") == 6
  end

  test "button 6 is returned for 'RR'" do
    assert Day2.move("RR") == 6
  end

  test "button 1 is returned for 'LU'" do
    assert Day2.move("LU") == 1
  end

  test "button 1 is returned for 'LUL'" do
    assert Day2.move("LUL") == 1
  end

  test "button 1 is returned for 'LULL'" do
    assert Day2.move("LULL") == 1
  end

  test "move_2 returns 5 for 'U'" do
    assert Day2.move_2("U") == "5"
  end

  test "move_2 returns 2 for 'RU'" do
    assert Day2.move_2("RU") == "2"
  end

  test "move_2 returns 2 for 'RRRRR'" do
    assert Day2.move_2("RRRRR") == "9"
  end

  test "move_2 returns 2 for 'RRRR'" do
    assert Day2.move_2("RRRR") == "9"
  end

  test "move_2 returns 2 for 'RRRRU'" do
    assert Day2.move_2("RRRRU") == "9"
  end
  test "move_2 returns 10 for 'LRUUURDDLLL'" do
    assert Day2.move_2("LRUUURDDLLL") == "A"
  end

  test "move_2 returns 10 for 'RRUUUDDDDLLLRRRRDD'" do
    assert Day2.move_2("RRUUUDDDDLLLRRRRDD") == "D"
  end
end

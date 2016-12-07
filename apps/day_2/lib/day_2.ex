defmodule Day2 do
  def part_1(filename) do
    File.stream!(filename)
    |> Enum.map(&move/1)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.join
    |> IO.puts
  end

  def move(instructions) do
    String.strip(instructions)
    |> move(5)
  end

  def move("", current_button), do: current_button
  def move("U"<>rest_of_instructions, current_button) when current_button > 3 do
    move(rest_of_instructions, current_button - 3)
  end
  def move("U"<>rest_of_instructions, current_button) do
    move(rest_of_instructions, current_button)
  end
  def move("D"<>rest_of_instructions, current_button) when current_button < 7 do
    move(rest_of_instructions, current_button + 3)
  end
  def move("D"<>rest_of_instructions, current_button) do
    move(rest_of_instructions, current_button)
  end
  def move("L"<>rest_of_instructions, current_button) when rem(current_button, 3) != 1 do
    move(rest_of_instructions, current_button - 1)
  end
  def move("L"<>rest_of_instructions, current_button) do
    move(rest_of_instructions, current_button)
  end
  def move("R"<>rest_of_instructions, current_button) when rem(current_button, 3) != 0 do
    move(rest_of_instructions, current_button + 1)
  end
  def move("R"<>rest_of_instructions, current_button) do
    move(rest_of_instructions, current_button)
  end





  def part_2(filename) do
    File.stream!(filename)
    |> Enum.map(&move_2/1)
    |> Enum.join()
    |> IO.puts
  end

  def move_2(instructions) do
    String.strip(instructions)
    |> move_2(5)
    |> translate_to_button_name()
  end

  def move_2("", current_button), do: current_button
  def move_2("U"<>rest_of_instructions, current_button) when current_button in [1,2,4,5,9] do
    move_2(rest_of_instructions, current_button)
  end
  def move_2("U"<>rest_of_instructions, current_button) when current_button in [3,13] do
    move_2(rest_of_instructions, current_button - 2)
  end
  def move_2("U"<>rest_of_instructions, current_button) do
    move_2(rest_of_instructions, current_button - 4)
  end
  def move_2("R"<>rest_of_instructions, current_button) when current_button in [1,4,9,12,13] do
    move_2(rest_of_instructions, current_button)
  end
  def move_2("R"<>rest_of_instructions, current_button) do
    move_2(rest_of_instructions, current_button + 1)
  end
  def move_2("D"<>rest_of_instructions, current_button) when current_button in [5,9,10,12,13] do
    move_2(rest_of_instructions, current_button)
  end
  def move_2("D"<>rest_of_instructions, current_button) when current_button in [1,11] do
    move_2(rest_of_instructions, current_button + 2)
  end
  def move_2("D"<>rest_of_instructions, current_button) do
    move_2(rest_of_instructions, current_button + 4)
  end
  def move_2("L"<>rest_of_instructions, current_button) when current_button in [1,2,5,10,13] do
    move_2(rest_of_instructions, current_button)
  end
  def move_2("L"<>rest_of_instructions, current_button) do
    move_2(rest_of_instructions, current_button - 1)
  end

  defp translate_to_button_name(10), do: "A"
  defp translate_to_button_name(11), do: "B"
  defp translate_to_button_name(12), do: "C"
  defp translate_to_button_name(13), do: "D"
  defp translate_to_button_name(button_number) do
    Integer.to_string(button_number)
  end
end

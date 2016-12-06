defmodule Day1 do

  def part_2(filename) do
    File.read!(filename)
    |> blocks_away
    |> IO.puts
  end

  def blocks_away(directions) do
    directions
    |> String.strip()
    |> String.split(", ", trim: true)
    |> Enum.reduce([{0, 0, :north}], &blocks_away/2)
    |> Enum.reverse()
    |> Enum.map(&strip_compass_direction/1)
    |> find_first_location_visited_twice([])
    |> calculate_blocks
  end

  def blocks_away("R"<>num_blocks, path_so_far) do
    num_blocks = String.to_integer(num_blocks)
    {current_x, current_y, compass_direction} = List.first(path_so_far)
    case compass_direction do
      :north -> add_to_path((current_x+1)..(current_x+num_blocks), current_y, :east, path_so_far)
      :south -> add_to_path((current_x-1)..(current_x-num_blocks), current_y, :west, path_so_far)
      :east -> add_to_path(current_x, (current_y-1)..(current_y-num_blocks), :south, path_so_far)
      :west -> add_to_path(current_x, (current_y+1)..(current_y+num_blocks), :north, path_so_far)
    end
  end
  def blocks_away("L"<>num_blocks, path_so_far) do
    num_blocks = String.to_integer(num_blocks)
    {current_x, current_y, compass_direction} = List.first(path_so_far)
    case compass_direction do
      :north -> add_to_path((current_x-1)..(current_x-num_blocks), current_y, :west, path_so_far)
      :south -> add_to_path((current_x+1)..(current_x+num_blocks), current_y, :east, path_so_far)
      :east -> add_to_path(current_x, (current_y+1)..(current_y+num_blocks), :north, path_so_far)
      :west -> add_to_path(current_x, (current_y-1)..(current_y-num_blocks), :south, path_so_far)
    end
  end

  defp add_to_path(x, y, new_compass_direction, path_so_far) when is_integer(y) do
    Enum.map(x, &({&1, y, new_compass_direction}))
    |> Enum.reverse()
    |> Kernel.++(path_so_far)
  end
  defp add_to_path(x, y, new_compass_direction, path_so_far) when is_integer(x) do
    Enum.map(y, &({x, &1, new_compass_direction}))
    |> Enum.reverse()
    |> Kernel.++(path_so_far)
  end

  # def find_first_location_visited_twice([location_to_check | _], locations_checked) when location_to_check in locations_checked, do: location_to_check
  def find_first_location_visited_twice([location_to_check | rest_of_locations], locations_checked) do
    if location_to_check in locations_checked do
      location_to_check
    else
      find_first_location_visited_twice(rest_of_locations, [location_to_check | locations_checked])
    end
  end

  defp strip_compass_direction({x, y, _compass_direction}), do: {x, y}

  defp calculate_blocks({x, y}), do: abs(x) + abs(y)
end

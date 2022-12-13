class Day12 < Day

  def part1
    run_dijkstra
    # print_map
    @points[@start_position][:distance]
  end

  def part2
    run_dijkstra
    @points.select { _2[:elevation].zero? }.map { _2[:distance] }.min
  end

  def print_map
    path = []
    current_point = @start_position
    while current_point
      path << current_point
      current_point = @points[current_point][:previous_point]
    end

    input_lines.each.with_index do |line, y|
      line.chars.each.with_index do |elevation, x|
        if path.include? [x, y]
          print "\e[41m#{elevation}\e[0m"
        else
          print elevation
        end
      end
      puts ""
    end

    nil
  end

  def run_dijkstra
    parse_input
    initialize_graph

    @points[@end_position][:distance] = 0

    while @points.any? { _2[:visited] == false }
      pos, point = @points.reject { _2[:visited] }.sort_by { _2[:distance] }.first
      point[:visited] = true
      point[:neighbours].reject { @points[_1][:visited] }.each do |neighbour|
        new_neighbour_distance = point[:distance] + 1
        if new_neighbour_distance < @points[neighbour][:distance]
          @points[neighbour][:distance] = new_neighbour_distance
          @points[neighbour][:previous_point] = pos
        end
      end
    end
  end

  def parse_input
    @points = {}
    input_lines.each.with_index do |line, y|
      line.chars.each.with_index do |elevation, x|
        point = [x, y]
        if elevation == "S"
          @start_position = point
          elevation = 'a'
        end

        if elevation == "E"
          @end_position = point
          elevation = 'z'
        end

        elevation = elevation.ord - 'a'.ord

        @points[[x, y]] = {
          elevation: elevation,
        }
      end
    end
  end

  def initialize_graph
    @points.each do |position, point|
      point.merge!(
        neighbours: [],
        distance: 10**100,
        visited: false,
        previous_point: nil,
      )

      [
        [position[0] + 1, position[1]],
        [position[0] - 1, position[1]],
        [position[0] , position[1] + 1],
        [position[0], position[1] - 1],
      ].each do |adjacent|
        if @points[adjacent] && @points[adjacent][:elevation] >= (point[:elevation] - 1)
          point[:neighbours] << adjacent
        end
      end
    end
  end

end

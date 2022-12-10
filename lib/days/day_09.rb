class Day9 < Day

  def part1
    follow_input(2)
  end

  def part2
    follow_input(10)
  end

  private

  def follow_input(rope_length)
    rope_positions = ([[0,0]] * rope_length).map(&:clone)
    visited = {}

    input_lines.each do |line|
      direction, count = line.split(' ')
      count.to_i.times do
        rope_positions[0] = move(rope_positions[0], direction)

        (rope_length - 1).times do |i|
          if distance(rope_positions[i], rope_positions[i+1]) > 1.5
            dx = rope_positions[i][0] - rope_positions[i+1][0]
            dy = rope_positions[i][1] - rope_positions[i+1][1]
            dx /= dx.abs unless dx.zero?
            dy /= dy.abs unless dy.zero?

            rope_positions[i+1][0] += dx
            rope_positions[i+1][1] += dy
          end
        end
        visited[rope_positions.last.clone] = true
      end

      # print_rope_positions(rope_positions)
      # puts "########################"
    end
    visited.count
  end

  def move(start, direction)
    x, y = start

    case direction
    when 'U'
      y -= 1
    when 'R'
      x += 1
    when 'D'
      y += 1
    when 'L'
      x -= 1
    end

    [x, y]
  end

  def distance(point_1, point_2)
    x = point_1[0] - point_2[0]
    y = point_1[1] - point_2[1]

    Math.sqrt(x * x + y * y)
  end

  def print_rope_positions(rope_positions)
    min_x = rope_positions.map(&:first).min
    max_x = rope_positions.map(&:first).max

    min_y = rope_positions.map(&:last).min
    max_y = rope_positions.map(&:last).max

    field = [[' ']*(max_x+min_x.abs+2)]*(max_y+min_y.abs+2)
    field.map!(&:clone)

    rope_positions.reverse.each_with_index do |pos, index|
      designator = ((index == 9) ? 'H' : (9 - index))
      field[pos[1] + min_y.abs + 1][pos[0] + min_x.abs + 1] = designator
    end

    puts field.map { _1.join '' }
  end

end

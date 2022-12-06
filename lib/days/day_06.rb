class Day6 < Day

  def part1
    get_count_to_valid_marker(4)
  end

  def part2
    get_count_to_valid_marker(14)
  end

  private

  def get_count_to_valid_marker(window_size)
    window = []
    input.chars.each.with_index(1) do |char, index|
      window.append char
      window = window.last(window_size)
      if window.uniq.count == window.count && window.count == window_size
        return index
      end
    end
  end

end

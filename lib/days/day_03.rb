class Day3 < Day

  def part1
    input_lines.sum do |line|
      line
        .chars
        .each_slice(line.length / 2)
        .reduce(&:intersection)
        .map { item_to_priority(_1) }
        .sum
    end
  end

  def part2
    input_lines.each_slice(3).sum do |group|
      group
        .map(&:chars)
        .reduce(&:intersection)
        .first
        .yield_self { item_to_priority(_1) }
    end
  end

  private

  def item_to_priority(item)
    case item
    when ('a'..'z')
      item.ord - 'a'.ord + 1
    when ('A'..'Z')
      item.ord - 'A'.ord + 27
    end
  end

end

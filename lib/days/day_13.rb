class Day13 < Day

  DIVIDER_PACKETS = [[[2]], [[6]]]

  def part1
    parse_input
      .slice_before(&:nil?)
      .map { _1.reject(&:nil?) }
      .each.with_index(1)
      .sum { |pair, index| compare_arrays(*pair) == 1 ? index : 0 }
  end

  def part2
    packets = parse_input
      .reject(&:nil?)
      .append(*DIVIDER_PACKETS)
      .sort { |a, b| compare_arrays(b, a) }

    DIVIDER_PACKETS
      .map { packets.index(_1) + 1 }
      .reduce(:*)
  end

  def compare_arrays(a, b)
    if a.is_a?(Integer) && b.is_a?(Integer)
      b <=> a
    else
      a = a.clone
      b = b.clone

      a = [a] unless a.is_a?(Array)
      b = [b] unless b.is_a?(Array)

      while true
        element_a = a.shift
        element_b = b.shift

        return 0 if element_a.nil? && element_b.nil?
        return 1 if element_a.nil?
        return -1 if element_b.nil?

        comparison_result = compare_arrays(element_a, element_b)
        return comparison_result if comparison_result != 0
      end
    end
  end

  def parse_input
    input_lines.map { JSON.parse(_1) unless _1.strip.empty? }
  end

end

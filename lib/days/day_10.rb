class Day10 < Day

  SAMPLE_POINTS =

  def part1
    process_input
      .map.with_index { |value, index| value * (index + 1) if (index + 21) % 40 == 0 }
      .compact
      .sum
  end

  def part2
    "\n" + process_input
      .map.with_index { |value, index| (value - 1) <= (index % 40) && (index % 40) <= (value + 1) }
      .map { _1 ? '█' : ' ' }
      .each_slice(40)
      .map { _1.join('') }
      .join("\n")
  end

  def process_input
    signal = [1]
    input_lines.each do |line|
      case line
      when 'noop'
        signal.append(signal.last)
      when /^addx (-?\d+)/
        signal.append(signal.last)
        signal.append(signal.last + $1.to_i)
      end
    end
    signal[...-1]
  end

end

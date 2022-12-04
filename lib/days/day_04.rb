class Day4 < Day

  def part1
    count_lines_by { _1.subset?(_2) || _2.subset?(_1) }
  end

  def part2
    count_lines_by { (_1 & _2).any? }
  end

  private

  def count_lines_by
    input_lines.count do |line|
      elfs = line.split(',')
      sections = elfs.map do |elf|
        start_section, end_section = elf.split('-').map(&:to_i)
        (start_section..end_section).to_set
      end
      yield(*sections)
    end
  end
end

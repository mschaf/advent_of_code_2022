class Day1 < Day

  def part1
    calories_per_elf.max
  end

  def part2
    calories_per_elf.sort.last(3).sum
  end

  private

  def calories_per_elf
    input_lines.map(&:to_i).slice_before(&:zero?).map(&:sum)
  end

end

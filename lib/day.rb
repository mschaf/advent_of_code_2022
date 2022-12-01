class Day

  def run(part:)
    send("part#{part}")
  end

  private

  def input_file
    "input/day_#{day.to_s.rjust(2, '0')}.txt"
  end

  def input
    File.open(input_file).read
  end

  def input_lines
    input.split("\n")
  end

  def day
    self.class.to_s.match(/Day(\d+)/).captures.first.to_i
  end

end
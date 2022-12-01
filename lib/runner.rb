class Runner

  def initialize(day: nil, part: nil)
    @day = day
    @part = part
  end

  def run(with_print: false)
    parts = @part ? [@part] : [1, 2]

    outputs = parts.map do |part|
      puts "Running day #{@day} part #{part}:" if with_print
      day_class = Kernel.const_get("Day#{@day}")
      output = day_class.new.run(part: part)
      puts "  Output: #{output}" if with_print
      output
    end

    outputs.count == 1 ? outputs.first : outputs
  end

end

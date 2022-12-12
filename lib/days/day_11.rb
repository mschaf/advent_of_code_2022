class Day11 < Day

  MONKEY_REGEX = <<~REGEX
    Monkey (?<number>\\d+):
      Starting items: (?<items>(?:\\d+, )*\\d+)
      Operation: (?<operation>new = old [+*] (\\d+|old))
      Test: divisible by (?<test>\\d+)
        If true: throw to monkey (?<true_destination>\\d+)
        If false: throw to monkey (?<false_destination>\\d+)
  REGEX

  def part1
    parse_monkey_data
    20.times { do_monkey_round(divide_worry_level: true) }
    level_of_monkey_business
  end

  def part2
    parse_monkey_data
    10000.times { |i| do_monkey_round }
    level_of_monkey_business
  end

  def level_of_monkey_business
    @monkey_data.map { |_, monkey| monkey[:inspect_count] }.sort.last(2).reduce(&:*)
  end

  def do_monkey_round(divide_worry_level: false)
    @monkey_data.each do |_, monkey|
      while monkey[:items].any?
        old = monkey[:items].shift
        item = nil
        operation = monkey[:operation].gsub('new', 'item')
        eval(operation)
        item /= 3 if divide_worry_level
        item %= common_divisor

        destination = monkey[item % monkey[:test] == 0 ? :true_destination : :false_destination]
        @monkey_data[destination][:items].append item
        monkey[:inspect_count] += 1
      end
    end
  end

  def common_divisor
    @monkey_data.map { |_, m| m[:test] }.reduce(&:*)
  end

  def parse_monkey_data
    matches = []
    input.scan(Regexp.new(MONKEY_REGEX, Regexp::MULTILINE)) { matches << $~ }
    @monkey_data = matches.map(&:named_captures).map do |monkey_data|
      monkey_data.transform_keys!(&:to_sym)
      monkey_data[:items] = monkey_data[:items].split(',').map(&:to_i)
      %i(number test true_destination false_destination inspect_count).each do |key|
        monkey_data[key] = monkey_data[key].to_i
      end
      [monkey_data[:number], monkey_data]
    end.to_h
  end

end

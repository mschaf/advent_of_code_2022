class Day5 < Day

  def part1
    move_create
  end

  def part2
    move_create(move_all_at_once: true)
  end

  private

  def move_create(move_all_at_once: false)
    stacks = input_stacks
    input_actions.each do |action|
      items = stacks[action[:source]].pop(action[:amount].to_i)
      items.reverse! unless move_all_at_once
      stacks[action[:destination]].append(*items)
    end
    stacks.values.map(&:last).join('')
  end

  def input_stacks
    stacks_string = input.split("\n\n").first.split("\n")
    stacks_string
      .map(&:chars)
      .transpose.map(&:reverse) # rotate array
      .select { _1.first =~ /^\d$/ } # cut lines without a stack
      .map { [_1.shift, _1.select { |i| i != ' ' }] }
      .to_h
  end

  def input_actions
    stacks_string = input.split("\n\n").last.split("\n")
    stacks_string.map do |action|
      action
        .match(/move (?<amount>\d+) from (?<source>\d+) to (?<destination>\d+)/)
        .named_captures
        .transform_keys(&:to_sym)
    end
  end


end

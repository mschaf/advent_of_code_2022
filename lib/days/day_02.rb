class Day2 < Day

  STRATEGY_MAP = {
    'A' => :rock,
    'B' => :paper,
    'C' => :scissors,
    'X' => :rock,
    'Y' => :paper,
    'Z' => :scissors,
  }

  SCORE_MAP = {
    rock: 1,
    paper: 2,
    scissors: 3,
  }

  WIN_MAP = {
    rock: :paper,
    paper: :scissors,
    scissors: :rock,
  }

  WIN_SCORE = 6
  DRAW_SCORE = 3

  def part1
    score = 0
    input_lines.each do |line|
      enemy_action, my_action = line.split.map { STRATEGY_MAP.fetch(_1) }
      score += SCORE_MAP.fetch(my_action)

      if enemy_action == my_action
        score += DRAW_SCORE
      elsif WIN_MAP.fetch(enemy_action) == my_action
        score += WIN_SCORE
      end
    end
    score
  end

  def part2
    score = 0
    input_lines.each do |line|
      enemy_action, outcome = line.split
      enemy_action = STRATEGY_MAP.fetch(enemy_action)

      my_action = case outcome
        when 'X' # loose
          WIN_MAP.invert.fetch(enemy_action)
        when 'Y' # draw
          score += DRAW_SCORE
          enemy_action
        when 'Z' # win
          score += WIN_SCORE
          WIN_MAP.fetch(enemy_action)
        end

      score += SCORE_MAP.fetch(my_action)
    end
    score
  end

end

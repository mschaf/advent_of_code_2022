class Day8 < Day

  def part1
    visible_count = 0

    for_each_tree do |height:, left:, right:, top:, bottom:|
      if [left, right, top, bottom].any? { (_1.max || -1) < height }
        visible_count +=1
      end
    end

    visible_count
  end

  def part2
    best_view = 0

    for_each_tree do |height:, left:, right:, top:, bottom:|
      view = [left, right, top, bottom]
       .map { _1.index { |h| h >= height }&.next || _1.length }
       .reduce(&:*)

      best_view = view if view > best_view
    end

    best_view
  end

  private

  def for_each_tree(&block)
    grid = input_grid
    width = grid.first.count
    height = grid.count

    width.times do |x|
      height.times do |y|
        row = grid[y]
        column = grid.map { _1[x] }

        block.call(
          height: grid[y][x],
          left: row.slice(...x).reverse,
          right: row.slice(x+1..),
          top: column.slice(...y).reverse,
          bottom: column.slice(y+1..)
        )
      end
    end
  end

  def input_grid
    input_lines.map { _1.chars.map(&:to_i) }
  end

end

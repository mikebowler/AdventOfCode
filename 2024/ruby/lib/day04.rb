# frozen_string_literal: true

class Day04
  def parse data
    data.lines.collect { |line| line.chomp.chars }
  end

  def count_all data
    grid = parse data
    possible_lines =
      group_horizontally(grid) +
      group_vertically(grid) +
      group_diagonally_from_top_left(grid) +
      group_diagonally_from_top_left(rotate(grid))

    possible_lines.collect { |line| count line }.sum
  end

  def count text
    text.scan('XMAS').count + text.reverse.scan('XMAS').count
  end

  def group_horizontally grid
    grid.collect(&:join)
  end

  def group_vertically grid
    width = grid.first.length
    (0...width).collect do |row_index|
      grid.collect { |l| l[row_index] }.join
    end
  end

  def group_diagonally_from_top_left grid
    x_grid = grid.first.length
    y_grid = grid.size

    (0...((y_grid * 2) - 1)).collect do |y|
      text = []
      x_index = 0
      y_index = y

      while y_index >= 0 && x_index < x_grid
        current_line = grid[y_index]
        text << current_line[x_index] if current_line
        x_index += 1
        y_index -= 1
      end
      text.join
    end
  end

  def rotate grid
    grid_width = grid.first.length
    grid_height = grid.size

    (0..(grid_width - 1)).collect do |x|
      ((grid_height - 1)..0).step(-1).collect do |y|
        grid[y][x]
      end
    end
  end

  # def puzzle1 data
  # end
end

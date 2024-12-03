# frozen_string_literal: true

class Day02
  def parse data
    data.lines.collect do |line|
      line.split(/\s+/).collect(&:to_i)
    end
  end

  def line_safe? line, dampen_problems: false
    sorted_line = line.sort
    return dampen_and_retry(line, dampen_problems) unless line == sorted_line || line.reverse == sorted_line

    sorted_line.reduce do |a, b|
      return dampen_and_retry(line, dampen_problems) unless [1, 2, 3].include?((a - b).abs)

      b
    end
    true
  end

  def dampen_and_retry line, dampen_problems
    return false if dampen_problems == false

    line.each_with_index do |_level, index|
      return true if line_safe?(line[0,index].concat(line[index + 1..-1]))
    end
    false
  end

  def safe_count data, dampen_problems: false
    total = 0
    parse(data).each do |line|
      total += 1 if line_safe?(line, dampen_problems: dampen_problems)
    end
    total
  end
end


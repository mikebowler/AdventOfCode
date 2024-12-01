# frozen_string_literal: true

class Day01
  def parse data
    left = []
    right = []
    data.lines.collect do |line|
      raise "Can't parse #{line}" unless line =~ /^(\d+)\s+(\d+)$/

      left << $1.to_i
      right << $2.to_i
    end
    [left, right]
  end

  def puzzle1 data
    left, right = parse data
    left.sort!
    right.sort!

    total = 0
    left.each_with_index do |num, index|
      total += (num - right[index]).abs
    end
    total
  end

  def puzzle2 data
    left, right = parse data
    answer = 0
    left.each do |number|
      answer += number * right.select { |n| n == number }.size
    end
    answer
  end
end

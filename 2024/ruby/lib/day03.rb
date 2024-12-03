# frozen_string_literal: true

class Day03
  def parse1 data
    data
      .scan(/mul\((\d+),(\d+)\)/)
      .collect { |pair| pair[0].to_i * pair[1].to_i }
      .sum
  end

  def parse2 data
    enabled = true
    total = 0
    data
      .scan(/mul\((\d+),(\d+)\)|(do)\(\)|(don't)\(\)/)
      .each do |a, b, enable, disable|
        if enable
          enabled = true
        elsif disable
          enabled = false
        elsif enabled
          total += (a.to_i * b.to_i)
        end
      end
    total
  end
end

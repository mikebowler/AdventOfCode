# frozen_string_literal: true

require './lib/day03'

describe Day03 do
  let(:subject) { Day03.new }

  context 'puzzle 1' do
    it 'Parses provided test case' do
      data = 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'
      expect(subject.parse1 data).to eq 161
    end

    it 'parses real data' do
      data = File.read './lib/data03.txt'
      expect(subject.parse1 data).to eq 174_561_379
    end
  end

  context 'puzzle 2' do
    it 'Parses provided test case' do
      data = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
      expect(subject.parse2 data).to eq 48
    end

    it 'parses real data' do
      data = File.read './lib/data03.txt'
      expect(subject.parse2 data).to eq 106_921_067
    end
  end
end

# frozen_string_literal: true

require './lib/day01'

describe Day01 do
  let(:subject) { Day01.new }

  context 'puzzle 1' do
    it 'processes provided sample' do
      data = <<~TEXT
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
      TEXT
      expect(subject.puzzle1 data).to eq 11
    end

    it 'processes real data' do
      data = File.read('./lib/data1.txt')
      expect(subject.puzzle1 data).to eq 1_879_048
    end
  end

  context 'puzzle 2' do
    it 'processes provided sample' do
      data = <<~TEXT
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
      TEXT
      expect(subject.puzzle2 data).to eq 31
    end

    it 'processes real data' do
      data = File.read('./lib/data1.txt')
      expect(subject.puzzle2 data).to eq 1_879_048
    end
  end
end

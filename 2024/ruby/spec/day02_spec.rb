# frozen_string_literal: true

require './lib/day02'

describe Day02 do
  let(:subject) { Day02.new }

  context 'line_safe?' do
    it 'is safe because the levels are all decreasing by 1 or 2.' do
      expect(subject.line_safe? [7, 6, 4, 2, 1]).to be_truthy
    end

    it 'is unsafe because 2 7 is an increase of 5' do
      expect(subject.line_safe? [1, 2, 7, 8, 9]).to be_falsey
    end

    it 'is unsafe because 6 2 is a decrease of 4.' do
      expect(subject.line_safe? [9, 7, 6, 2, 1]).to be_falsey
    end

    it 'is unsafe because 1 3 is increasing but 3 2 is decreasing' do
      expect(subject.line_safe? [1, 3, 2, 4, 5]).to be_falsey
    end

    it 'is unsafe because 4 4 is neither an increase or a decrease' do
      expect(subject.line_safe? [8, 6, 4, 4, 1]).to be_falsey
    end

    it 'is safe because the levels are all increasing by 1, 2, or 3' do
      expect(subject.line_safe? [1, 3, 6, 7, 9]).to be_truthy
    end

    it 'is safe' do
      expect(subject.line_safe? [92, 90, 88, 85, 82, 79, 78, 77]).to be_truthy
    end

    it 'is safe by removing the second level' do
      expect(subject.line_safe? [1, 3, 2, 4, 5], dampen_problems: true).to be_truthy
    end

    it 'is safe by removing the third level' do
      expect(subject.line_safe? [8, 6, 4, 4, 1], dampen_problems: true).to be_truthy
    end
  end

  context 'puzzle 1' do
    it 'processes provided sample' do
      data = <<~TEXT
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
      TEXT

      expect(subject.safe_count data).to eq 2
    end

    it 'processes raw data' do
      data = File.read('./lib/data02.txt')
      expect(subject.safe_count data).to eq 213
    end
  end

  context 'puzzle 2' do
    it 'processes provided sample' do
      data = <<~TEXT
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
      TEXT

      expect(subject.safe_count data, dampen_problems: true).to eq 4
    end

    it 'processes raw data' do
      data = File.read('./lib/data02.txt')
      expect(subject.safe_count data, dampen_problems: true).to eq 285
    end
  end
end

# frozen_string_literal: true

require './lib/day04'

describe Day04 do
  let(:subject) { Day04.new }

  context 'counting' do
    it 'counts right' do
      expect(subject.count 'MMMSXXMASM').to eq 1
    end

    it 'counts left and right with overlap' do
      expect(subject.count 'SAMXMAS').to eq 2
    end
  end

  context 'grouping' do
    it 'groups vertically' do
      grid = subject.parse <<~TEXT
        XS
        MA
        AM
        SX
      TEXT

      expect(subject.group_vertically grid).to eq %w[XMAS SAMX]
    end

    it 'groups diagonally from top left' do
      grid = subject.parse <<~TEXT
        ABCD
        EFGH
        IJKL
        MNOP
      TEXT
      expect(subject.group_diagonally_from_top_left grid).to eq %w[A EB IFC MJGD NKH OL P]
    end
  end

  context 'rotate_grid' do
    it '' do
      grid = subject.parse <<~TEXT
        ABC
        DEF
        GHI
        KLM
      TEXT
      expect(subject.rotate grid).to eq subject.parse <<~TEXT
        KGDA
        LHEB
        MIFC
      TEXT
    end
  end

  context 'puzzle 1' do
    it 'Parses provided test case' do
      data = <<~TEXT
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
      TEXT
      expect(subject.count_all data).to eq 18
    end

    it 'parses real data' do
      data = File.read('./lib/data04.txt')
      expect(subject.count_all data).to eq 2530
    end
  end

  # context 'puzzle 2' do
  #   it 'Parses provided test case' do
  #   end

  #   it 'parses real data' do
  #   end
  # end
end

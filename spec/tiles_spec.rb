require 'spec_helper'
require 'boggle/tiles'
require 'boggle/tile'
require 'array'

RSpec.describe Boggle::Tiles do
  subject { described_class }
  let(:tiles) { subject.generate(dimension) }
  let(:dimension) { 4 }
  let(:total_tiles) { dimension**2 }

  describe '#generate' do
    it 'generates a new set of tiles' do
      expect(tiles.length).to be total_tiles
    end

    it 'generates unique ids for each tile' do
      expect(tiles.map(&:id).uniq.length).to be total_tiles
    end
  end

  describe 'neighbours' do
    # ["A", "B", "C"]
    # ["D", "E", "F"]
    # ["G", "H", "I"]
    let(:dimension) { 3 }
    let(:expected_neighbour_mapping) do
      {
        "A" => %w(D B E),
        "B" => %w(A D E F C),
        "C" => %w(B E F),
        "D" => %w(A B E G H),
        "E" => %w(A B C D F G H I),
        "F" => %w(C B E H I),
        "G" => %w(D E H),
        "H" => %w(D G E F I),
        "I" => %w(E F H),
      }
    end
    let(:generated_tiles) { ('A'..'I').map { |letter| Boggle::Tile.new(letter) } }

    before do
      allow_any_instance_of(Boggle::Tiles).to receive(:create_tiles).and_return(generated_tiles)
    end

    it 'links neighbours correctly' do
      tiles.each do |tile|
        actual_neighbours = tile.neighbours.map(&:letter).sort
        expected_neighbours = expected_neighbour_mapping[tile.letter].sort

        expect(actual_neighbours).to eq expected_neighbours
      end
    end
  end
end
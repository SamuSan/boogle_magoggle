require 'spec_helper'
require 'boggle/tiles'
require 'boggle/tile'

RSpec.describe Boggle::Tiles do
  subject { described_class }
  let(:dimension) { 4 }
  let(:total_tiles) { dimension**2 }

  describe '#generate' do
    let(:tiles) { subject.generate(dimension) }

    it 'generates a new set of tiles' do
      expect(tiles.length).to be total_tiles
    end

    it 'generates unique ids for each tile' do
      expect(tiles.map(&:id).uniq.length).to be total_tiles
    end
  end

  describe 'neighbours' do
    # ["A", "B", "C"]
    # ["E", "F", "G"]
    # ["I", "J", "K"]
    let(:dimension) { 3 }
    let(:expected_neighbour_mapping) do
      {
        "A" => %w(E B F),
        "B" => %w(A C E F G),
        "C" => %w(B F G),
        "E" => %w(A I B F J),
        "F" => %w(A B C E G I J K),
        "G" => %w(B F J C K),
        "I" => %w(E F J),
        "J" => %w(E F G I K),
        "K" => %w(F G J),
      }
    end
    let(:tiles) { ('A'..'K').map { |letter| Boggle::Tile.new(letter) } }

    before do
      allow_any_instance_of(Boggle::Tiles).to receive(:create_tiles).and_return(tiles)
    end

    it 'links neighbours correctly' do
      tiles.each do |tile|
          binding.pry
        actual_neighbours = tile.neighbours.map(&:letter).sort
        expected_neighbours = expected_neighbour_mapping[tile.letter].sort

        expect(actual_neighbours).to eq expected_neighbours
      end
    end
  end
end
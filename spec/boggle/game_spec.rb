require 'spec_helper'
require 'boggle/game'
require 'boggle/tiles'
require 'boggle/tile'

RSpec.describe Boggle::Game do
  subject { described_class }

  describe 'all_words' do
    let(:generated_tiles) do
      [
        %w(q s q),
        %w(q a q),
        %w(q t q),
      ].flatten.map { |letter| Boggle::Tile.new(letter) }
    end

    before do
      allow_any_instance_of(Boggle::Tiles).to receive(:create_tiles).and_return(generated_tiles)
    end

    it 'returns all possible words' do
      expect(subject.all_words(Boggle::Tiles.generate(3))).to be %w(sat at)
    end
  end
end

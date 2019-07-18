require 'spec_helper'
require 'boggle/tiles'

RSpec.describe Boggle::Tiles do
  subject { described_class }
  let(:grid_size) { 16 }

  describe '#generate' do
    let(:tiles) { subject.generate(grid_size) }

    it 'generates a new set of tiles' do
      expect(tiles.length).to be grid_size
    end

    it 'generates unique ids for each tile' do
      expect(tiles.map(&:id).uniq.length).to be grid_size
    end
  end
end
module Boggle
  class Tiles
    CANDIDATE_LETTERS = (('A'..'Z').to_a - ["Q"]) << "Qu"

    def self.generate(dimension)
      self.new(dimension**2).tiles
    end

    attr_reader :tiles

    def initialize(dimension)
      # TODO this should probably shit the bed if the grid size doesn't make sense
      @tiles = create_tiles(dimension)
      link_neighbours(@tiles)
    end

    private

    def create_tiles(dimension)
      tiles = CANDIDATE_LETTERS.shuffle.sample(dimension).map do |letter|
        Tile.new(letter)
      end
    end

    def link_neighbours(tiles)
      linkage_collection = tiles.dup
      dimension = Integer.sqrt(tiles.length)
      tiles
    end
  end
end

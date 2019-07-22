module Boggle
  class Tile
    attr_reader :id, :letter, :neighbours

    def initialize(letter)
      @id = "#{letter}#{(Array.new(2) { Random.rand(1000) }).join}"
      @letter = letter
      @neighbours = []
    end

    def link_to(tile)
      @neighbours << tile
      tile.neighbours << self
    end
  end
end

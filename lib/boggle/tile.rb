module Boggle
  class Tile
    attr_reader :id, :letter, :neighbours

    def initialize(letter)
      @id = "#{letter}#{(Array.new(2) { Random.rand(1000) }).join}"
      @letter = letter
      @neighbours = []
      @visited = false
    end

    def link_to(tile)
      @neighbours << tile
      tile.neighbours << self
    end

    def unvisit!
      @visited = false
    end

    def visit!
      @visited = true
    end

    def unvisited?
      !visited?
    end

    def visited?
      @visited
    end
  end
end

module Boggle
  class Tiles
    ALPHABET = ('A'..'Z').to_a

    def self.generate(grid_size)
      letters = (ALPHABET - ["Q"]) << "Qu"

      letters.shuffle.sample(grid_size).map do |letter|
        Tile.new(letter)
      end
    end
  end

  class Tile
    attr_reader :id

    def initialize(letter)
      @id = "#{letter}#{(Array.new(2) { Random.rand(1000) }).join}"
      @letter = letter
      @neighbours = []
    end
  end
end

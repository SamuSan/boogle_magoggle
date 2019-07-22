module Boggle
  class Game
    def self.all_words(tiles)
      @@found_words = []
      @@edge = []
      @@tiles = tiles

      tiles.each do |tile|
        puts search_words(tile)
      end
      nil
    end

    def self.search_words(tile)
      @@tiles.each { |tile| tile.unvisit! }
      sub_string = ""
      stack = []

      stack.push(tile)

      while stack.length > 0
        s = stack.pop

        if s.unvisited?
          sub_string << s.letter
          p sub_string
          s.visit!
        end

        s.neighbours.each do |neighbour|
          stack.push(neighbour) unless neighbour.visited?
        end
      end
    end

    private_class_method :search_words
  end
end

module Boggle
  class Tiles
    CANDIDATE_LETTERS = (('A'..'Z').to_a - ["Q"]) << "Qu"
    PAIRS = 2
    TRIPLES = 3

    def self.generate(dimension)
      self.new(dimension**2).tiles
    end

    def self.show(arr)
      arr.map(&:letter).join("\s")
    end

    attr_reader :tiles

    def initialize(dimension)
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
      dimension = Integer.sqrt(tiles.length)

      # split into dimension sized chunks and pad out with a fake Tile
      rows = pad_rows(tiles, dimension)

      # link adjacent tiles
      rows.each_cons_window_of(PAIRS).each do |pair|
        link_horizontally_adjacent(pair)
        link_vertical_and_diagonally_adjacent(pair) unless pair.length < 2
      end

      tiles
    end

    def link_vertical_and_diagonally_adjacent(pair)
      top, bottom = *pair

      # remove the pad from top
      top = top.select(&:letter)
      target = top.shift

      bottom.each_cons_window_of(TRIPLES).each do |trio|
        trio.select(&:letter).each do |tile|
          link_tiles(target, tile)
        end

        target = top.shift
        return if target.nil?
      end
    end

    def link_horizontally_adjacent(pair)
      top, bottom = *pair

      top.each_cons(PAIRS).each do |neighbours|
        #exclude pad tiles
        if neighbours.map(&:letter).all?
          left, right = *neighbours
          link_tiles(left, right)
        end
      end
    end

    def link_tiles(target, neighbour)
      target.link_to(neighbour)
    end

    def pad_rows(tiles, dimension)
      tiles.each_slice(dimension).map do |chunk|
        chunk.insert(0, Boggle::Tile.new(nil))
      end
    end
  end
end

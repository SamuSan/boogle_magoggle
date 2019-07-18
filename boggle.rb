require 'pry-byebug'

module Boggle
end

require './lib/game'
require './lib/tiles'
require './lib/grid'

grid = Boggle::Grid.new(Boggle::Tiles)
Boggle::Game.play
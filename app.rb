require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new
game.show_grid

while game.find_winner == false  do

# while game.find_winner == false && game.grid.any? {|i| i == " "} == true do
#   # round += 1
#   # puts "_______________________________________________________________________________________________________"
#   # puts "ROUND #{round}"
#   # print "\n"

  game.request_positions
  print "\n"
  game.show_grid


end

game.end


# binding.pry

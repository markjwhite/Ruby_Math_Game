require './game'
require './player'
require './question'

player1 = Player.new(1)
player2 = Player.new(2)

game = Game.new

game.start_game(player1, player2)

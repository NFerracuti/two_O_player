require_relative 'player'
require_relative 'question'
require_relative 'scoreboard'
require_relative 'game'

puts "Enter name for Player 1:"
name1 = gets.chomp
player1 = Player.new(name1)

puts "Enter name for Player 2:"
name2 = gets.chomp
player2 = Player.new(name2)

game = Game.new(player1, player2)
game.start_game

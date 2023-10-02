class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
    @scoreboard = ScoreBoard.new
  end

  def current_player
    @players[@current_player_index]
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def start_game
    until @players.any? { |player| !player.alive? }
      question = Question.new
      puts "#{current_player.name}: #{question.display_question}"
      answer = gets.chomp.to_i

      if answer == question.answer
        puts "#{current_player.name}: Correct! Moving on..."
      else
        puts "#{current_player.name}: Ew, no!"
        current_player.lose_life
      end
      puts @scoreboard.display_scores(@players[0], @players[1])
      switch_player
    end

    winner = @players.select { |player| player.alive? }.first
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end

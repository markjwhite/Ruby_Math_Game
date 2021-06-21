class Game
  def initialize
    @current_player = nil
    @current_question = nil
    @game_over = false
    @answer = nil
  end

  def set_current_player(player1, player2)
    if @current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
  end

  def check_for_winner(player1, player2)
    if player1.life == 0
      puts '---- GAME OVER ----'
      puts 'Player2 WINS!'
      @game_over = true
    end
    if player2.life == 0
      puts '---- GAME OVER ----'
      puts 'Player1 WINS!'
      @game_over = true
    end
  end

  def start_game(player1, player2)
    while @game_over == false
      self.set_current_player(player1, player2)

      puts '---- Start Turn ----'
      @current_question = Question.new

      puts "Player#{@current_player.id}, you're up!"

      ##Ask Question
      puts "What does #{@current_question.new_question} equal?"
      puts '>> '
      @answer = $stdin.gets.chomp.to_i

      ##Check Answer
      if @current_question.check_answer(@answer)
        puts "Player#{@current_player.id}: CORRECT ANSWER!"
      else
        puts "Player#{@current_player.id}: INCORRECT ANSWER: You lose a life!"
        @current_player.lose_life
      end

      #Display Score
      puts '----LIFE----'
      puts "Player1: #{player1.life}/3 vs Player2: #{player2.life}/3"

      #Check For Game Over
      self.check_for_winner(player1, player2)
    end
  end
end

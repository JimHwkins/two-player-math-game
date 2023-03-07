require_relative 'player'

class MathGame
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start
    loop do
      puts "----- NEW TURN -----"
      num1 = rand(1..20)
      num2 = rand(1..20)
      answer = num1 + num2
      puts "#{current_player.name}: What does #{num1} plus #{num2} equal?"
      print "> "
      guess = gets.chomp.to_i
      if guess == answer
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
      puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
      puts ""
      if current_player.dead?
        puts "
  +-----------------------------------------+
  |              GAME OVER                  |
  +-----------------------------------------+
  |                                         |
  |               WINNER                    |
  |    #{other_player.name} wins with a score of #{other_player.lives}/3    |
  |                                         |
  +-----------------------------------------+
  |              Good bye!                  |
  +-----------------------------------------+
"
puts ""
        break
      end
      switch_players
    end
  end

  private

  attr_reader :player1, :player2
  attr_accessor :current_player

  def switch_players
    self.current_player = current_player == player1 ? player2 : player1
  end

  def other_player
    current_player == player1 ? player2 : player1
  end
end
class Game 
  attr_accessor :player1, :player2, :current_player

  def initialize (player1, player2)
    self.player1 = player1
    self.player2 = player2
    self.current_player = [player1, player2].sample
  end

  def question_asker 
    while true do
      first_random_variable = rand(1..20)
      second_random_variable = rand(1..20)

      puts "#{self.current_player.name}: What does #{first_random_variable} + #{second_random_variable} equal"

      number = gets.chomp.to_i

      if number == (first_random_variable + second_random_variable)
        puts "#{self.current_player.name}: YES! You are correct"
      else
        puts "#{self.current_player.name}: U stoopid"
        self.current_player.lose_life
      end

      puts "P1 #{self.player1.lives}/3 vs. P2 #{self.player2.lives}/3"


      if self.current_player.lives == 0
        winner = self.current_player == self.player1 ? self.player2 : self.player1
        puts "#{winner.name} wins with a score of #{winner.lives}/3"
        puts "----- Game Over ----"
        puts "Good Bye!"
        break if self.current_player.lives == 0
      end

      self.current_player = self.current_player == self.player1 ? self.player2 : self.player1
      
      puts "----- New Turn -----"
    end
  end
end
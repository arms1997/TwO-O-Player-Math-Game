require "./game"
require "./player"
require "./questions"

armeen = Player.new("armeen")
aryan = Player.new("aryan")

game = Game.new(armeen, aryan)

while game.player1.alive && game.player2.alive

  question = Questions.new

  question.read_question(game.current_player.name)

  answer = gets.chomp.to_i

  if question.check_answer(answer)
    puts "#{game.current_player.name}: Yes! you are correct"
  else
    puts "#{game.current_player.name}: NO! you are NOT correct"
    game.current_player.lose_life
  end

  break if !game.current_player.alive

  game.change_player
  game.life_status
  puts "----- New Turn -----"
end

puts "----- GAME OVER -----"
# game.life_status
game.winner?

puts "#{game.winner.name} is the winner with a score of #{game.winner.lives}/3!!"



require "./game"
require "./player"

armeen = Player.new("armeen")
aryan = Player.new("aryan")

new_game = Game.new(armeen, aryan)

new_game.question_asker

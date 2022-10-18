require 'bundler'
Bundler.require

require_relative 'lib/player.rb'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points >0
  puts "Voici l'état de nos joueurs:"
  puts player1.show_state
  puts player2.show_state
  print "\n"

  puts "Passons à la phase d'attaque :"
  player2.life_points <= 0 ? break : player2.attacks(player1)
  print "\n"
  player1.life_points <= 0 ? break : player1.attacks(player2)
  print"\n"
  
end

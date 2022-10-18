require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

#set-up les joueurs et le tableau

p1 = Player.new("Mattéo") 
p2 = Player.new("Angel")
enemy = [p1,p2]

puts "
-------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
------------------------------------------------- "

puts "Quelle est ton nom champion ?"

    player = gets.chomp 

    player = HumanPlayer.new(player)

while player.life_points >0 && (p1.life_points > 0 || p2.life_points >0)

    puts "Voici l'état de #{player.name} :"
    puts player.show_state 
    puts " "

    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts " "

    puts "attaquer un joueur en vue :"
    puts "0 - #{p1.name} a #{p1.life_points} points de vie"
    puts "1 - #{p2.name} a #{p2.life_points} points de vie"
    puts " "

    print ">"
    choose = gets.chomp.downcase

    if choose == "a" 
        puts player.search_weapon
    
    elsif choose == "s"
        puts player.search_health_pack
    
    elsif choose == "0"
        puts player.attacks(p1) 

    elsif choose == "1"
        puts player.attacks(p2)
    elsif choose == "exit" || choose == "quit"
        puts "La lâcheté est inée visiblement" 
        break
    end
    puts " "

        enemy.each { |i| i.life_points <= 0 ? break : i.attacks(player) }
    
end

puts "La partie est finie"

if player.life_points > 0 && (p1.life_points <= 0 && p2.life_points <= 0)

puts "BRAVO ! TU AS GAGNE !"

elsif player.life_points <= 0

puts "Loser ! Tu as perdu !"

end 
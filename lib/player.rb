require 'pry'

class Player
  attr_accessor :name, :life_points
  
  def initialize(user_name)
    @name = user_name
    @life_points = 10
  end

  def show_state
    return "#{@name} a #{@life_points} point de vie"
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    puts @life_points > 0 ? "#{@name} a #{@life_points} points de vie" : "Le joueur #{@name} a été tué !"
  end

  def attacks(player)
    puts "le joueur #{name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} de dommage"
    player.gets_damage(damage)
  end
  
  def compute_damage
    return rand(1..6)
  end
  
end
binding.pry
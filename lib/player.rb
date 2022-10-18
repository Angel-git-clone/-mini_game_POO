require 'pry'

class Player
  attr_accessor :name, :life_points, :weapons_level
  
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


class HumanPlayer < Player #Hériter la class
  
  def initialize(human_player)
    @name = human_player
    @life_points = 100
    @weapons_level = 1
  end

  def show_state
  puts  "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapons_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    
    return "Tu as trouvé une arme de niveau #{new_weapon}"
    
    if new_weapon > @weapons_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : Prends la!" 
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end

  end

  def search_health_pack
   health_pack = rand(1..6)

   if health_pack == 1
      puts "Tu n'as rien trouvé...tristesse"
   elsif 2 <= health_pack <= 5
      @life_points = @life_points + 50

      if @life_points > 100 
        @life_points = 100 
      end

      puts "Bravo, tu as trouvé un pack: +50 points de vie ! Tu es maintenant au top de ta forme!"

    elsif health_pack == 6
      @life_points = @life_points + 80
      
      if @life_points > 100
        @life_points = 100
      end

      puts "Waow, tu as trouvé un pack: +80 points de vie ! Tu es revitalisé!"

    end
  end
end

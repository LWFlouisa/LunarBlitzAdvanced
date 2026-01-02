def init_stats
  $player_hp       = 10
  $shoe_durability = 10
  $antidotes       = 10
  $emergency_ax    = 10

  # Is the player poisoned?
  $player_poison = false
    
  # It is presently unknown whether water is acidic.
  $water_acidic  = false
  
  # Does the player have a boat that can resist acid lakes?
  $player_boat   = false
  
  # Available monsters for grinding
  $sea_gargoyal = 150
  $acid_dragon  = 150
  $acid_serpent = 150
end

def mettre_de_sabots(a, b, c)
  "#{a} slips on special clogs to walk from #{b} to #{c}."
end

def porte_de_sabots(a, b, c)
  "#{a} walks in the clogs to walk from #{b} to #{c}."
  
  $shoe_durability = $shoe_durability - 1
end

def dommage_de_koke(a)
  # Damages a specified character with poison moss.
  
  $player_hp = $player_hp - 5
  
  "The #{a} currently has ##{$player_hp} life points left."
end

def poison_koke(a, b)
  # Spreads poison moss from specified distribution.
  
  "The poison moss spread from tile #{a} to tile #{b}."
  
  dommage_de_koke(your_name)
end

def est_empoisonne?(a)
  if $player_poison == true
    $player_hp = $player_hp - 5
  elsif $player_poison == true and $antidote >= 0
    $antiodate = $antidote - 1
    
    puts "#{a} has been cleared of poison."
  else
    puts "#{a} has not been poisoned."
  end
end

def avoir_un_bateau?(a)
  if    $player_boat == true and $water_acidic == false
    "#{a} has a boat, but is the water acidic?"
  
    est_eau_de_acide?(cthulhu_temple)
  elsif $player_boat == false and $water_acidic == true
    est_eau_de_acide?(cthulhu_temple)
    
    "You need to find a boat that can resist the PH value of dead restless spirits."
  elsif $player_boat == true and $water_acidic == true
    "#{a} has a boat that can be rowed across #{b}."
  else
    "#{a} has no boat doesn't know if water is acidic."
  end
end

def est_monstre_proche?(a, b, c)
  if $sea_gargoyal > 0
    "The sea gargoyals of #{a} are nearby."
    
    fight_snakes?(a)
  end
  
  if $acid_dragon > 0
    "The acid dragons of #{b} are nearby."
    
    fight_dragons?(b)
  end
  
  if $acid_serpent > 0
    "The acid snakes of #{c} are nearby."
    
    fight_serpents?(c)
  end
end

def est_porte_fermee?(a)
  if    $door_locked == true and $emergency_ax == false
    "Is the door locked? Yes, go find an emergency ax."
  elsif $door_locked == true and $emergency_ax == true
    "Is the door locked? You used the emergency ax."

    $emergency_ax = $emergency_ax - 1
  elsif $door_locked == false and $emergency_ax == false
    "Is the door locked? But its still advised to find an emergency ax."
  elsif $door_locked == false and $emergency_ax == true
    "Is the door locked? No, but save the ax for fighting monsters."
  else
  end
end

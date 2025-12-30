def yumekusari(a, b, c, map_y, map_x)
  require "NeoPathfinding"

  markov_one = Gabbler.new
  markov_two = Gabbler.new
  markov_tre = Gabbler.new
  
  markov_one.learn(a)
  markov_two.learn(b)
  markov_tre.learn(c)
  
  d = markov_one.sentence
  e = markov_two.sentence
  f = markov_tre.sentence
  
  2.times do
    get_statistics(:markov_one, a,
                   :markov_two, b,
                   :markov_tre, c)
                 
                   dynamic_reward_allocation
                   #thresholding($current_probability, map_y, map_x)
  end
end

def yumekusari_f(d, e, f)
  require "NeoPathfinding"

  markov1 = Gabbler.new
  markov2 = Gabbler.new
  markov3 = Gabbler.new

  a = d # cette("pomme", "rouge")
  b = e # maisette("pomme", "vert")
  c = f # sinon("pomme", "rouge", "vert", "sinon")

  ouvert("data/cette/cette_results.txt",       a,
         "data/maisette/maisette_results.txt", b,
         "data/sinon/sinon_results.txt",       c)
       
  results_de_cette    = File.read("data/cette/cette_results.txt")
  results_de_maisette = File.read("data/maisette/maisette_results.txt")
  results_de_sinon    = File.read("data/sinon/sinon_results.txt")

  markov1.learn(results_de_cette)
  markov2.learn(results_de_maisette)
  markov3.learn(results_de_sinon)

  g = markov1.sentence
  h = markov2.sentence
  i = markov3.sentence

  2.times do
    get_statistics(:markov_one, g,
                   :markov_two, h,
                   :markov_tre, i)
                 
                   dynamic_reward_allocation
                   thresholding($current_probability, 12, 12)
  end
end

puts "JPop Album Archical"
yumekusari("[ Archive ] This predicts whether the player will stab the enemy.",
           "[ Timeout ] This predicts whether the player will run out of days and hours to archive JPop CDs.",
           "[ Death ] This predicts how likely the player will die from their injuries.",
           
           12, 12)

thresholding($current_probability, 12, 12)

puts "Combat Mechanics"
yumekusari("[ Shoot ] This predicts whether the player will shoot the enemy.",
           "[ Steal ] This predicts whether the player will steal from the enemy.",
           "[ Stab ] This predicts whether the player will stab the enemy.",
           
           12, 12)

thresholding($current_probability, 12, 12)
           
puts "Ship Logistics"
yumekusari("[ Attack ] This allows you to defeat enemy ships normally.",
           "[ Repair Ship ] Repair your space cruiser when supplies get low.",
           "[ Kamikaze ] Self destruct your ship and wait for rescue.",
           
           12, 12)

thresholding($current_probability, 12, 12)
           
puts "Stranded Logistics"
yumekusari("[ Make Boots ] Allows the player to make a walkpath out of alien gunmetal.",
           "[ Healing Cactus ] Healing cactus heals the player.",
           "[ Alien Gunmetal ] Collect alien gunmetal to make walkpaths.",
           
           12, 12)
           
thresholding($current_probability, 12, 12)

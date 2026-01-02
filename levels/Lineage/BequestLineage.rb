require "NeoPathfinding"

def find_predessesor(a, b)
  current_group_one = File.readlines("data/current_group/group_one.txt")
  current_group_two = File.readlines("data/current_group/group_two.txt")
  current_group_tre = File.readlines("data/current_group/group_tre.txt")
  
  size_limit = current_group_one.size.to_i, current_group_two.size.to_i, current_group_tre.size.to_i
  
  group_one_limit = size_limit[0]
  group_two_limit = size_limit[1]
  group_two_limit = size_limit[2]

  index = 0
  
  group_one_limit.times do
    current_group_selection = current_group_one[index].strip.to_s
    
    if not current_group_selection == a
      puts"#{b} is not the previous generation of #{current_group_selection}, therefore not: #{a} is the current generation."
    else      
      $factoid_one = "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    
      puts "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    end
    
    index = index + 1
  end
  
  index = 0
  
  group_two_limit.times do
    current_group_selection = current_group_two[index].strip.to_s
    
    if not current_group_selection == a
      puts"#{b} is not the previous generation of #{current_group_selection}, therefore not: #{a} is the current generation."
    else      
      $factoid_two = "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    
      puts "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    end
    
    index = index + 1
  end

  index = 0
  
  group_two_limit.times do
    current_group_selection = current_group_tre[index].strip.to_s
    
    if not current_group_selection == a
      puts"#{b} is not the previous generation of #{current_group_selection}, therefore not: #{a} is the current generation."
    else      
      $factoid_tre = "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    
      puts "#{b} is the previous generation of #{current_group_selection}, therefore: #{a} is the current generation."
    end
    
    index = index + 1
  end
end

def analyze_predessecors
  factoid_one = $factoid_one
  factoid_two = $factoid_two
  factoid_tre = $factoid_tre

  2.times do
    get_statistics(:trivia_one, factoid_one,
                   :trivia_two, factoid_two,
                   :trivia_tre, factoid_tre)
                   
                   dynamic_reward_allocation
  end
end

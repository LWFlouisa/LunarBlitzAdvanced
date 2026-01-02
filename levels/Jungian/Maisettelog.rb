############################################################################################################
#                                             Maisettelog                                                  #
############################################################################################################
# These are rules for handling Maisette logic processing.                                                  #
############################################################################################################
def reconstruct(a, b, c)
  a = a.to_f
  b = b.to_f
  c = c.to_f

  a + b + c
end

def find_loss_ratio(ratio)
  upper_bound = 1.0 / ratio
  lower_bound = 1.0 - upper_bound
  
  lost_data   = ratio - 1.0
  
  "If the first ratio is #{upper_bound} and the second ratio is #{lower_bound} then #{lost_data} blends into the next pie chart."
end

def quantiffirm(p, q, probability)
  case probability
  when 0.00010..0.1250
    "#{p} therefore #{q} is false."
  when 0.1251..0.3625
    "#{p} therefore #{q} is largely false."
  when 0.3626..0.5125
    "#{p} therefore #{q} is partially true."
  when 0.5126..0.7563
    "#{p} therefore #{q} is largely true."
  when 0.7564..0.9999
    "#{p} therefore #{q} is true."
  else
    "#{p} therefore #{q} is not quantifiable."
  end
end

def etudevaluate(a1, a2, b1, b2, c1, c2, x, y)
  2.times do
    get_statistics(:first_word,  graviteformee(a1, a2),
                   :second_word, graviteformee(b1, b2),
                   :third_word,  graviteformee(c1, c2))

                   dynamic_reward_allocation
                   dynamic_reward_allocation

    cognitive_threshold = 100
    probability         = 0.9 / $current_probability
    odds                = probability / ( 1 - probability )
    charted_assessment  = cognitive_threshold * probability
    
    size_of_map_y = x
    size_of_map_x = y
    
    map_cognitive_y = ( size_of_map_y * charted_assessment ) % size_of_map_y
    map_cognitive_x = ( size_of_map_x * charted_assessment ) % size_of_map_x
  
    puts "\nLEARNING ASSESSMENT"
    puts "The current map size is: #{x} by #{y}"
    puts "The current cognitive threshold is #{cognitive_threshold}"
    puts "The current probability is #{probability}"
    puts "The current odds of learning this word is #{odds}"
    puts "The current assessment of learning ability is #{charted_assessment}"
    puts "Therefore the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}."
    puts quantiffirm("The cognitive threshold is #{cognitive_threshold}", "the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}", probability)
    
    puts " "
  end
end

def risk_factor(risk)
  case risk
  when 0.750..1.000; print "Maximum Risk"; puts quantiffirm(": Such activities carry Maximum Risk", "this activity probably has Maximum risk", risk)
  when 0.500..0.749; print "High Risk";    puts quantiffirm(": Such activities carry High Risk", "this activity probably has High risk",    risk)
  when 0.250..0.499; print "Medium Risk";  puts quantiffirm(": Such activities carry Medium Risk", "this activity probably has Medium risk",  risk)
  when 0.125..0.249; print "Mild Risk";    puts quantiffirm(": Such activities carry Mild Risk", "this activity probably has Mild risk",    risk)
  when 0.010..0.124; print "Minimal Risk"; puts quantiffirm(": Such activities carry Minimal Risk", "this activity probably has Minimal risk", risk)
  else
    puts "The risk factor is unquantifiable."
  end
end

def thresholding(a, y, x)
  cognitive_threshold = 100
  probability         = a
  odds                = probability / ( 1 - probability )
  charted_assessment  = cognitive_threshold * probability
    
  size_of_map_y = y
  size_of_map_x = x
    
  map_cognitive_y = ( size_of_map_y * charted_assessment ) % size_of_map_y
  map_cognitive_x = ( size_of_map_x * charted_assessment ) % size_of_map_x
  
  ## This is for charting end destinations.
  $map_cognitive_y = map_cognitive_y
  $map_cognitive_x = map_cognitive_x

  matrix = [
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ]

  grid = Grid.new(matrix)

  start_node = grid.node(map_cognitive_y, map_cognitive_y)
  end_node = grid.node(map_cognitive_y-5, map_cognitive_y-5)

  finder = AStarFinder.new()
  path = finder.find_path(start_node, end_node, grid)

  puts grid.to_s(path, start_node, end_node)
  
  puts "LEARNING ASSESSMENT"
  puts "The current map size is: #{x} by #{y}"
  puts "The current cognitive threshold is #{cognitive_threshold}"
  #puts "The current probability is #{probability}"
  puts "The current odds of learning this word is #{odds}"
  #puts "The current assessment of learning ability is #{charted_assessment}"
  puts "Therefore the approximate location of cognitive loading is the tile of #{map_cognitive_y.to_i} and #{map_cognitive_x.to_i}."
  puts quantiffirm("The cognitive threshold is #{cognitive_threshold}", "the approximate location of cognitive loading is the tile of #{map_cognitive_y} and #{map_cognitive_x}", probability)  
  puts " "
end

def constrained_random
  random_value = [
    [[240, 240, 240],
     [240, 240, 320],
     [240, 240, 480],
     [240, 240, 640]],

    [[320, 320, 240],
     [320, 320, 320],
     [320, 320, 480],
     [320, 320, 640]],

    [[480, 480, 240],
     [480, 480, 320],
     [480, 480, 480],
     [480, 480, 640]],

    [[640, 640, 240],
     [640, 640, 320],
     [640, 640, 480],
     [640, 640, 640]],
  ]
  
  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_input = random_value[cur_row][cur_col][cur_arr]

  current_input
end

def map_y_initializer(a)
  g = rand(a).to_i
  
  g
end

def map_x_initializer(a)
  g = rand(a).to_i
  
  g
end

def assert(d1, d2, e1, e2, f1, f2, map_x, map_y)
  a = d1, d2
  b = e1, e2
  c = f1, f2

  #print a; print b, puts c

  actions = [
    [[a[0], a[0], a[0]],
     [a[0], a[0], b[0]],
     [a[0], a[0], c[0]]],

    [[b[0], b[0], a[0]],
     [b[0], b[0], b[0]],
     [b[0], b[0], c[0]]],

    [[c[0], c[0], a[0]],
     [c[0], c[0], b[0]],
     [c[0], c[0], c[0]]],
  ], [
    [[a[1], a[1], a[1]],
     [a[1], a[1], b[1]],
     [a[1], a[1], c[1]]],

    [[b[1], b[1], a[1]],
     [b[1], b[1], b[1]],
     [b[1], b[1], c[1]]],

    [[c[1], c[1], a[1]],
     [c[1], c[1], b[1]],
     [c[1], c[1], c[1]]],    
  ]

  symbols      = actions[0]
  descriptions = actions[1]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_symbol = symbols[cur_row][cur_col][cur_arr]

  #puts current_symbol
  
  if    current_symbol == a[0]
    2.times do
      get_statistics(a[0], a[1],
                     b[0], b[1],
                     c[0], c[1])
                   
                     dynamic_reward_allocation
                     thresholding($current_probability, map_y, map_x)
    end
  elsif current_symbol == b[0]
    2.times do
      get_statistics(b[0], b[1],
                     c[0], c[1],
                     a[0], a[1])
                   
                     dynamic_reward_allocation
                     thresholding($current_probability, map_y, map_x)
    end
  elsif current_symbol == c[0]
    2.times do
      get_statistics(c[0], c[1],
                     a[0], a[1],
                     b[0], b[1])
                   
                     dynamic_reward_allocation
                     thresholding($current_probability, map_y, map_x)
    end
  else
    puts "C'est ne qoui je veux."

    2.times do
      get_statistics(a[0], a[1],
                     b[0], b[1],
                     c[0], c[1])
                   
                     dynamic_reward_allocation
                     thresholding($current_probability, map_y, map_x)
    end
  end
end

def get_edge_cases(a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2)
  a = [ a1, a2 ]
  b = [ b1, b2 ]
  c = [ c1, c2 ]
  d = [ d1, d2 ]
  e = [ e1, e2 ]
  f = [ f1, f2 ]

  edges_cases = [[
    [ a[0], e[0], b[0], d[0], f[0], c[0] ],
    [ e[0], b[0], d[0], f[0], c[0], a[0] ],
    [ b[0], d[0], f[0], c[0], a[0], e[0] ],
    [ d[0], f[0], c[0], a[0], e[0], b[0] ],
    [ f[0], c[0], a[0], b[0], d[0], e[0] ],
    [ c[0], a[0], e[0], b[0], d[0], f[0] ],
  ], [
    [ a[1], e[1], b[1], d[1], f[1], c[1] ],
    [ e[1], b[1], d[1], f[1], c[1], a[1] ],
    [ b[1], d[1], f[1], c[1], a[1], e[1] ],
    [ d[1], f[1], c[1], a[1], e[1], b[1] ],
    [ f[1], c[1], a[1], b[1], d[1], e[1] ],
    [ c[1], a[1], e[1], b[1], d[1], f[1] ],
  ]]
  
  symbols      = edges_cases[0]
  descriptions = edges_cases[1]

  row_options = [0, 1, 2, 3, 4, 5]
  col_options = [0, 1, 2, 3, 4, 5]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  
  first_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  first_description = descriptions[cur_row][cur_col] #[cur_arr]

  cur_row = row_options.sample
  cur_col = col_options.sample
  #cur_arr = arr_options.sample
  
  second_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  second_description = descriptions[cur_row][cur_col] #[cur_arr]

  cur_row = row_options.sample
  cur_col = col_options.sample
  #cur_arr = arr_options.sample
  
  third_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  third_description = descriptions[cur_row][cur_col] #[cur_arr]
  
  2.times do
    get_statistics(first_symbol,  first_description,
                   second_symbol, second_description,
                   third_symbol,  third_description)
                   
                   dynamic_reward_allocation
  end
  
  thresholding($current_probability, 12, 12)
end

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
                   thresholding($current_probability, map_y, map_x)
  end
end

def yumekusari_f(d, e, f)
  require "NeoPathfinding"

  markov1 = Gabbler.new
  markov2 = Gabbler.new
  markov3 = Gabbler.new

  a = d
  b = e
  c = f
       
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

def assign_parallel(a, b, c, d, e, f, g, h)
  require "NeoPathfinding"
  
  ## That
  cette(a, b);   that = $that[0], $that[1]

  ## But That
  maisette(c, d); but_that = $but_that[0], $but_that[1]

  ## Otherwise
  sinon(e, f, g, h)

  otherwise     = $otherwise[0], $otherwise[1]
  otherwise_not = $otherwise_not[0], $otherwise_not[1], $otherwise_not[2]

  ## Exclusive Otherwise
  ouvert("data/cette/cette_inventory.txt",
         "Cette #{that[0]} est #{that[1]}",
       
         "data/maisette/maisette_inventory.txt",
         "Maisette #{but_that[0]} est #{but_that[1]}",
       
         "data/sinon/sinon_inventory.txt",
         "Sinon cette #{otherwise_not[0]} n'est #{otherwise_not[1]} ou #{otherwise_not[2]}")
end

def find_predessesor(a, b)
  ancestor_group_one = File.readlines("data/predessesors/group_one.txt")
  ancestor_group_two = File.readlines("data/predessesors/group_two.txt")
  ancestor_group_tre = File.readlines("data/predessesors/group_tre.txt")
  
  size_limit = ancestor_group_one.size.to_i, ancestor_group_two.size.to_i, ancestor_group_tre.size.to_i
  
  group_one_limit = size_limit[0]
  group_two_limit = size_limit[1]
  group_two_limit = size_limit[2]

  index = 0
  
  group_one_limit.times do
    current_ancestors = ancestor_group_one[index].strip.to_s
    
    if current_ancestors == a
      $factoid_one = "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"
    
      puts "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"
    else
      puts "#{current_ancestors} is not the current generation of #{b} as its predessesor, therefore: #{a}"
    end
    
    index = index + 1
  end
  
  index = 0
  
  group_two_limit.times do
    current_ancestors = ancestor_group_two[index].strip.to_s

    if current_ancestors == a
      $factoid_two = "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"
    
      puts "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"
    else
      puts "#{current_ancestors} is not the current generation of #{b} as its predessesor, therefore: #{a}"
    end
    
    index = index + 1
  end

  index = 0
  
  group_two_limit.times do
    current_ancestors = ancestor_group_two[index].strip.to_s

    if current_ancestors == a
      $factoid_tre = "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"
    
      puts "#{current_ancestors} is the current generation of #{b} as its predessesor, therefore: #{a}"

    else
      puts "#{current_ancestors} is not the current generation of #{b} as its predessesor, therefore: #{a}"
    end
    
    index = index + 1
  end
end

def analyze_predessecors
  factoid_one = $factoid_one # find_predessesor("Guillotine", "Halifax Gibbet")
  factoid_two = $factoid_two # find_predessesor("Guillotine", "Halifax Gibbet")
  factoid_tre = $factoid_tre # find_predessesor("Guillotine", "Halifax Gibbet")

  2.times do
    get_statistics(:trivia_one, factoid_one,
                   :trivia_two, factoid_two,
                   :trivia_tre, factoid_tre)
                   
                   dynamic_reward_allocation
  end
end

############################################################################################################
#                                          Maisettelingua Autre                                            #
############################################################################################################
# These are the rest of the functions for the main portion of Maisettelingua.                              #
############################################################################################################
## Specify the person traveling, amount of miles, and where they're eating and sleeping.
def bedohabaxiros(a, b, c)
  "#{a} traveled #{b} miles to eat and sleep at #{c}."
end

## Inquire as to the impact of ones travels.
def nebedohabaxiros(a, b, c, d)
  "Traveling to #{a} that was #{b} miles to sleep and eat at #{c} was #{d}."
end

## Describe what is being cooked
def flambemange(a, b, c)
  "#{a} is #{b} on the #{c}."
end

## Inquire as to the impact of something being cooked
def neflambemange(a, b, c)
  "The impact of #{a} being #{c} on the #{c}."
end

## Request a device at a specific location
def tirersecour(a, b, c)
  "I want #{a} from {b} to {c}."
end

def netirersecour(a, b, c)
  "The impact of acquiring #{a} from #{b} to #{c}."
end

def bastion_de_lune(a, b, c)
  "Le bastion #{a} est geolocalise a #{b} en le lune region de #{c}."
end

# Elevators for retrieving traveling up a location and back down in one motion.
def deux_chemix_ascenseur(a, b, c)
  "an elevator that takes #{a}, from #{b} to #{c} and back to #{b}."
end

## A two way "elevator" that trades files rather than gets rid of them.
def deux_chemix_cinepark(a, b, c, d, e, f)
  new_file1 = a
  new_file2 = b
  
  old_directory1 = c
  old_directory2 = d
  
  new_directory1 = e
  new_directory2 = f
  
  wabisab(a, c, d)
  wabisab(b, e, f)
end

def is_house_deceptive?(a, b)
  "That house is #{a}, is really a construct of #{b}."
end

def show_deception(a, b, c)
  deceptive_houses = [
    [[a, a, a],
     [a, a, b],
     [a, a, c]],

    [[b, b, a],
     [b, b, b],
     [b, b, c]],
   
    [[c, c, a],
     [c, c, b],
     [c, c, c]],
  ]

  #probability_of_endpoint = 0.33 * 0.33 * 0.33

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  d = deceptive_houses[cur_row][cur_col][cur_arr]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  e = deceptive_houses[cur_row][cur_col][cur_arr]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  f = deceptive_houses[cur_row][cur_col][cur_arr]

  2.times do
    get_statistics(:first_deception,  d,
                   :second_deception, e,
                   :third_deception,  f)
                   
                   dynamic_reward_allocation
  end
end

def isolate_feature(a, b, c, d, e, f, g, h, i, j, k, l)
  require "SelfModifiedDecisionTree"
  
  suspicious_houses = RevisedBayes.new(:no_doors,     :one_door,   :two_doors,   :three_doors,   :four_doors),
                      RevisedBayes.new(:no_windows, :one_window, :two_windows, :three_windows, :four_windows),           
                      RevisedBayes.new(:no_garages, :one_garage, :two_garages, :three_garages, :four_garages),
                      RevisedBayes.new(:no_gardens, :one_garden, :two_gardens, :three_gardens, :four_gardens)
                      
  # Isolated Feature Sets
  door_types   = suspicious_houses[0]
  window_types = suspicious_houses[1]
  garage_types = suspicious_houses[2]
  garden_types = suspicious_houses[3]
  
  # Doors
  door_types.train(:no_doors,       "There are no doors on this building.", "no doors")
  door_types.train(:one_door,       "There are one door on this building.", "one door")
  door_types.train(:two_doors,     "There are two doors on this building.", "two doors")
  door_types.train(:three_doors, "There are three doors on this building.", "three doors")
  door_types.train(:four_doors,     "There are no doors on this building.", "four doors")
  
  # Windows
  window_types.train(:no_windows,       "There are no windows on this building.",    "one window")
  window_types.train(:one_window,       "There are one window on this building.",   "two windows")
  window_types.train(:two_windows,     "There are two windows on this building.", "three windows")
  window_types.train(:three_windows, "There are three windows on this building.",  "four windows")
  window_types.train(:four_windows,     "There are no windows on this building.",  "five windows")
  
  # Garage
  garage_types.train(:no_garages,       "There are no garages on this building.",    "no garages")
  garage_types.train(:one_garage,       "There are one garage on this building.",    "one garage")
  garage_types.train(:two_garages,     "There are two garages on this building.",   "two garages")
  garage_types.train(:three_garages, "There are three garages on this building.", "three garages")
  garage_types.train(:four_garages,     "There are no garages on this building.",  "four garages")
  
  # Garden
  garden_types.train(:no_gardens,       "There are no gardens on this building.",    "no gardens")
  garden_types.train(:one_garden,      "There are one garden on this building.",     "one garden")
  garden_types.train(:two_gardens,     "There are two gardens on this building.",   "two gardens")
  garden_types.train(:three_gardens, "There are three gardens on this building.", "three gardens")
  garden_types.train(:four_gardens,     "There are no gardens on this building.",  "four gardens")
  
  ## Classification of features
  d = is_house_deceptive?(a, deux_chemix_ascenseur(b, c, d))
  e = is_house_deceptive?(e, deux_chemix_ascenseur(f, g, h))
  f = is_house_deceptive?(i, deux_chemix_ascenseur(j, k, l))
  
  d_door_class   = door_types.classify(d)
  d_window_class = window_types.classify(d)
  d_garage_class = garage_types.classify(d)
  d_garden_class = door_types.classify(d)
  
  e_door_class   = door_types.classify(e)
  e_window_class = window_types.classify(e)
  e_garage_class = garage_types.classify(e)
  e_garden_class = door_types.classify(e)
  
  f_door_class   = door_types.classify(f)
  f_window_class = window_types.classify(f)
  f_garage_class = garage_types.classify(f)
  f_garden_class = door_types.classify(f)
  
  print "#{d_door_class} #{d_window_class} #{d_garage_class} #{d_garden_class}"; puts " "
  print "#{e_door_class} #{e_window_class} #{e_garage_class} #{e_garden_class}"; puts " "
  print "#{f_door_class} #{f_window_class} #{f_garage_class} #{f_garden_class}"; puts " "
  
  2.times do
    get_statistics(:first_house,  "#{d_door_class} #{d_window_class} #{d_garage_class} #{d_garden_class}",
                   :second_house, "#{e_door_class} #{e_window_class} #{e_garage_class} #{e_garden_class}",
                   :third_house,  "#{f_door_class} #{f_window_class} #{f_garage_class} #{f_garden_class}")
  
    print "Metaprobability: "
    dynamic_reward_allocation
  end
end

# Part of dream studios
def etudie_de_yume(a, b, c, d, e, f)
  a_list = [ a.to_sym, b, 0.33 ]
  b_list = [ c.to_sym, d, 0.33 ]
  c_list = [ e.to_sym, f, 0.33 ]
  
  a_analyses = is_house_deceptive?(a_list[0], deux_chemix_ascenseur("packages", "elevator entrance", "elevator cul de sac")), a_list[1]
  b_analyses = is_house_deceptive?(b_list[0], deux_chemix_ascenseur("packages", "elevator entrance", "elevator cul de sac")), b_list[1]
  c_analyses = is_house_deceptive?(c_list[0], deux_chemix_ascenseur("packages", "elevator entrance", "elevator cul de sac")), c_list[1]

  analyses_sessions = [
    [[a_analyses, a_analyses, a_analyses],
     [a_analyses, a_analyses, b_analyses],
     [a_analyses, a_analyses, c_analyses]],

    [[b_analyses, b_analyses, a_analyses],
     [b_analyses, b_analyses, b_analyses],
     [b_analyses, b_analyses, c_analyses]],

    [[c_analyses, c_analyses, a_analyses],
     [c_analyses, c_analyses, b_analyses],
     [c_analyses, c_analyses, c_analyses]],
  ]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  2.times do
    get_statistics(a_list[0], "[ #{a_list[1]}, #{a_list[2]} ]",
                   b_list[0], "[ #{b_list[1]}, #{b_list[2]} ]",
                   c_list[0], "[ #{c_list[1]}, #{c_list[2]} ]",)
                   
                   dynamic_reward_allocation
  end
end

module BequestStatus

  class Log
    def self.doorstatus
      discrete_state = [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ], [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ], [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ], [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ], [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ], [
        [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]],
        [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5]],
        [[2,0], [2,1], [2,2], [2,3], [2,4], [2,5]],
        [[3,0], [3,1], [3,2], [3,3], [3,4], [3,5]],
        [[4,0], [4,1], [4,2], [4,3], [4,4], [4,5]],
        [[5,0], [5,1], [5,2], [5,3], [5,4], [5,5]],
      ]

      # Labels for time of day
      times_of_day = ["Twilight",      "Dawn",
                      "Morning",  "Afternoon",
                      "Dusk",         "Night",
      ]

      # Labels for door status.
      door_status = [
        "Fully Closed",
        "Largely Closed",
        "Half Way Closed",
        "Largely Open",
        "Fully Open",
        "Door Torn Off",
      ]

      # Input for 0
      tim_options = [0, 1, 2, 3, 4, 5]
      row_options = [0, 1, 2, 3, 4, 5]
      col_options = [0, 1, 2, 3, 4, 5]
      arr_options = [0, 1]

      ctime = tim_options.sample
      crow  = row_options.sample
      ccol  = col_options.sample
      carr  = arr_options.sample

      un  = discrete_state[ctime][crow][ccol][carr]

      # Input for 1
      tim_options = [0, 1, 2, 3, 4, 5]
      row_options = [0, 1, 2, 3, 4, 5]
      col_options = [0, 1, 2, 3, 4, 5]
      arr_options = [0, 1]

      ctime = tim_options.sample
      crow  = row_options.sample
      ccol  = col_options.sample
      carr  = arr_options.sample

      de  = discrete_state[ctime][crow][ccol][carr]

      # Input for 2
      tim_options = [0, 1, 2, 3, 4, 5]
      row_options = [0, 1, 2, 3, 4, 5]
      col_options = [0, 1, 2, 3, 4, 5]
      arr_options = [0, 1]

      ctime = tim_options.sample
      crow  = row_options.sample
      ccol  = col_options.sample
      carr  = arr_options.sample

      tr  = discrete_state[ctime][crow][ccol][carr]

      # Input for 3
      tim_options = [0, 1, 2, 3, 4, 5]
      row_options = [0, 1, 2, 3, 4, 5]
      col_options = [0, 1, 2, 3, 4, 5]
      arr_options = [0, 1]

      ctime = tim_options.sample
      crow  = row_options.sample
      ccol  = col_options.sample
      carr  = arr_options.sample

      qa  = discrete_state[ctime][crow][ccol][carr] #.to_i

      current_status = discrete_state[un][de][tr][qa].to_i
      current_time   = times_of_day[current_status]
      current_state  = door_status[current_status]

      "[#{un}][#{de}][#{tr}][#{qa}] #{current_time}, #{current_state}"
    end
  end
end

def get_door_status
  a = BequestStatus::Log.doorstatus
  b = BequestStatus::Log.doorstatus
  c = BequestStatus::Log.doorstatus

  ouvert("data/door_statuses/status_of_doors_a.txt", a,
         "data/door_statuses/status_of_doors_b.txt", b,
         "data/door_statuses/status_of_doors_c.txt", c)
end

def analyze_doors
  results_de_cette    = File.read("data/door_statuses/status_of_doors_a.txt")
  results_de_maisette = File.read("data/door_statuses/status_of_doors_b.txt")
  results_de_sinon    = File.read("data/door_statuses/status_of_doors_c.txt")

  markov1.learn(results_de_cette)
  markov2.learn(results_de_maisette)
  markov3.learn(results_de_sinon)

  g = markov1.sentence
  h = markov2.sentence
  i = markov3.sentence

  2.times do
    get_statistics(:status_a, g,
                   :status_b, h,
                   :status_c, i)
                 
                   dynamic_reward_allocation
  end
  
  thresholding($current_probability, 12, 12)
end

############################################################################################################
#                                           Is Enetity Anomalous?                                          #
############################################################################################################
# This section specializes in analyzing anomalous enetites of a paranormal or supernatural nature.         #
############################################################################################################
def is_entity_anomalous?(a)
  if    a ==   :mundane; print "This entity is mundane. "
  elsif a == :uncertain; print "It is uncertain the nature of this entity. "
  elsif a == :anomalous; print "This entity is possibly anomalous in nature. "
  else
    print "It is uncertain the nature of this entity. "
  end
end

def study_artefacts?(d, e, f)
  a = :object,  d
  b = :subject, e
  c = :verb,    f
  
  g = :mundane, :uncertain, :anomalous
  
  aspects = [
    [[a[0], a[0], a[0]], [a[0], a[0], b[0]], [a[0], a[0], c[0]]],
    [[b[0], b[0], a[0]], [b[0], b[0], b[0]], [b[0], b[0], c[0]]],
    [[c[0], c[0], a[0]], [c[0], c[0], b[0]], [c[0], c[0], c[0]]],
  ], [
    [[a[1], a[1], a[1]], [a[1], a[1], b[1]], [a[1], a[1], c[1]]],
    [[b[1], b[1], a[1]], [b[1], b[1], b[1]], [b[1], b[1], c[1]]],
    [[c[1], c[1], a[1]], [c[1], c[1], b[1]], [c[1], c[1], c[1]]],
  ], [
    [[g[0], g[0], g[0]],
     [g[0], g[0], g[1]],
     [g[0], g[0], g[2]]],

    [[g[1], g[1], g[0]],
     [g[1], g[1], g[1]],
     [g[1], g[1], g[2]]],

    [[g[2], g[2], g[0]],
     [g[2], g[2], g[1]],
     [g[2], g[2], g[2]]],
  ]
  
  symbols      = aspects[0]
  description  = aspects[1]
  nature       = aspects[2]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_symbol      = symbols[cur_row][cur_col][cur_arr] #.strip
  current_description = description[cur_row][cur_col][cur_arr] #.strip
  current_nature      = nature[cur_row][cur_col][cur_arr] #.strip

  $current_nature = current_nature
  
  "#{current_symbol}, #{current_description}"
end

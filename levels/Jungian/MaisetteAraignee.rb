#########################################################################################################
#                                          Maisette Araignee                                            #
#########################################################################################################
def init_statistics
  $monsters = 0
  $inches_from_monster = 150
end

def assess_distance(a, b) # Map rooms and objects
  "Estimating distance of #{a} from location #{b} in #{$inches_from_monster} feet."
end

def sound_intensity?(a, b) # sound intensity
  "Intense sound of #{a} are coming from the direction of #{b}."
end

def is_contained?(a, b) # Containment levels
  "#{a} is contained in the direction of #{b}."
end

def is_monster_near?(a, b) # Enemy proximity
  $monsters = $monsters + 1
  
  "#{a} is encroaching near #{b}."
end

# For surrounding area of 480 px, find confirmed entities in 75 speculated.
def gather_information(a, b) # Analytics
  surrounding_noise  = 1 / a
  useable_data       = 1 - surrounding_noise
  possible_anomalies = useable_data * 0.16

  confirmed_entities = b * possible_anomalies
  
  environmental_data = [ surrounding_noise, useable_data, possible_anomalies, confirmed_entities ],
                       [ :surrounding_noise, :useable_data, :possible_anomalies, :confirmed_entities ]
                       
  2.times do
    get_statistics(environmental_data[1][1], "The current surrounding noise is of #{b * surrounding_noise} entities.",
                   environmental_data[1][2],       "The current possible anomalies are #{b * useable_data} entities.",
                   environmental_data[1][3],     "The current possible anomalies are #{confirmed_entities} entities.")
                   
                   dynamic_reward_allocation
  end
  
  #sum_of_probabilities
end

def build_web(a, b) # Scouting
  init_statistics

  puts "#{a} is building a web at #{b}."
  
  assess_distance("encampment", "cavern")
  sound_intensity?("bear growls", "cavern")
  is_contained?("hidden treasure", "ancient temple")
  
  is_monster_near?("ursinehomme", your_encampment)
  
  gather_information(256, $monsters)
end

def simulation(a, b, c, d, e, f, g, h, i)
  plure = :player_lure, a
  pstun = :player_stun, b
  ptrap = :player_trap, c

  scout  = :build_web,          d
  gather = :gather_information, e
  detect = :detect_monster,     f

  elure = :maid_lure, g
  estun = :maid_stun, h
  etrap = :maid_trap, i

  human_behaviours = [
    [[ plure[0], plure[0], plure[0] ], [ plure[0], plure[0], pstun[0] ], [ plure[0], plure[0], ptrap[0] ]],
    [[ pstun[0], pstun[0], plure[0] ], [ pstun[0], pstun[0], pstun[0] ], [ pstun[0], pstun[0], ptrap[0] ]],
    [[ ptrap[0], ptrap[0], plure[0] ], [ ptrap[0], ptrap[0], pstun[0] ], [ ptrap[0], ptrap[0], ptrap[0] ]],
  ], [
    [[ plure[1], plure[1], plure[1] ], [ plure[1], plure[1], pstun[1] ], [ plure[1], plure[1], ptrap[1] ]],
    [[ pstun[1], pstun[1], plure[1] ], [ pstun[1], pstun[1], pstun[1] ], [ pstun[1], pstun[1], ptrap[1] ]],
    [[ ptrap[1], ptrap[1], plure[1] ], [ ptrap[1], ptrap[1], pstun[1] ], [ ptrap[1], ptrap[1], ptrap[1] ]],
  ]
  
  pet_behaviours = [
    [[  scout[0],  scout[0], scout[0] ], [  scout[0],  scout[0], gather[0] ], [  scout[0],  scout[0], detect[0] ]],
    [[ gather[0], gather[0], scout[0] ], [ gather[0], gather[0], gather[0] ], [ gather[0], gather[0], detect[0] ]],
    [[ detect[0], detect[0], scout[0] ], [ detect[0], detect[0], gather[0] ], [ detect[0], detect[0], detect[0] ]],
  ], [
    [[  scout[1],  scout[1], scout[1] ], [  scout[1],  scout[1], gather[1] ], [  scout[1],  scout[1], detect[1] ]],
    [[ gather[1], gather[1], scout[1] ], [ gather[1], gather[1], gather[1] ], [ gather[1], gather[1], detect[1] ]],
    [[ detect[1], detect[1], scout[1] ], [ detect[1], detect[1], gather[1] ], [ detect[1], detect[1], detect[1] ]],
  ]
  
  maid_behaviours = [
    [[ elure[0], elure[0], elure[0] ], [ elure[0], elure[0], estun[0] ], [ elure[0], elure[0], etrap[0] ]],
    [[ estun[0], estun[0], elure[0] ], [ estun[0], estun[0], estun[0] ], [ estun[0], estun[0], etrap[0] ]],
    [[ etrap[0], etrap[0], elure[0] ], [ etrap[0], etrap[0], estun[0] ], [ etrap[0], etrap[0], etrap[0] ]],
  ], [
    [[ elure[1], elure[1], elure[1] ], [ elure[1], elure[1], estun[1] ], [ elure[1], elure[1], etrap[1] ]],
    [[ estun[1], estun[1], elure[1] ], [ estun[1], estun[1], estun[1] ], [ estun[1], estun[1], etrap[1] ]],
    [[ etrap[1], etrap[1], elure[1] ], [ etrap[1], etrap[1], estun[1] ], [ etrap[1], etrap[1], etrap[1] ]],
  ]
  
  human_symbols      = human_behaviours[0]
  human_descriptions = human_behaviours[1]
  pet_symbols        = pet_behaviours[0]
  pet_descriptions   = pet_behaviours[1]
  maid_symbols        = maid_behaviours[0]
  maid_descriptions   = maid_behaviours[1]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_human_symbol      = human_symbols[cur_row][cur_col][cur_arr]
  current_human_description = human_descriptions[cur_row][cur_col][cur_arr]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_pet_symbol      = pet_symbols[cur_row][cur_col][cur_arr]
  current_pet_description = pet_descriptions[cur_row][cur_col][cur_arr]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_maid_symbol      = maid_symbols[cur_row][cur_col][cur_arr]
  current_maid_description = maid_descriptions[cur_row][cur_col][cur_arr]
   
  2.times do
    get_statistics(current_human_symbol, current_human_description,
                   current_pet_symbol,     current_pet_description,
                   current_maid_symbol,   current_maid_description)
                   
                   dynamic_reward_allocation
                   dynamic_reward_allocation

  end
  
  #sum_of_probabilities
end

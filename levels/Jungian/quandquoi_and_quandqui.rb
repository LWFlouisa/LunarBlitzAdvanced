#################################################################################################################
#                                           quandquoi and quandqui                                              #
#################################################################################################################
# These are rules discovered by my AI algorithm in order to augment its own problem solving. One focuses on     #
# when the event happened and who did it. The other focusing on when it happened what the thing in question     #
# was.                                                                                                          #
#################################################################################################################
def qui(a, b) # Who
  "Cette #{a} es un / une #{b}."
end

def quoi(a, b) # What
  "Cette #{a} est #{b} avec un #{c}"
end

def quand(a, b) # When
  "Quand es #{a}? C'est est a #{b}?"
end

def ou(a, b) # Where
  "Ou'est #{a} travailles? #{b} travailles a #{b}."
end

def pourquoi(a, b)
  "Est #{a} pourquou vous #{b}?"
end

def comme(a, b, c)
  "Vous doit #{a} avec un #{b} a #{c}."
end

def interrogatif(a, b, c)
  2.times do
    get_statistics(:interrogatif_une,   a,
                   :interrogatif_deux,  b,
                   :interrogatif_trois, c)
                   
                   dynamic_reward_allocation
  end
end

def chart_interrogatif(a, b, c, map_x, map_y)
  2.times do
    get_statistics(:interrogatif_une,   a,
                   :interrogatif_deux,  b,
                   :interrogatif_trois, c)
                   
                   dynamic_reward_allocation
                   thresholding($current_probability, map_y, map_x)
  end
end

def is_entity_anomalous?(a)
  if    a ==   :mundane; print "This entity is mundane."
  elsif a == :uncertain; print "It is uncertain the nature of this entity."
  elsif a == :anomalous; print "This entity is possibly anomalous in nature."
  else
    print "It is uncertain the nature of this entity."
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
  
  "#{current_symbol} : #{current_description}"
  
  #print is_entity_anomalous?(current_nature)
end

# A B C D E F
# A E B D F C
    
def study_artefacts_debiased(d, e, f)
  a = :artefact_one, d
  b = :artefact_two, e
  c = :artefact_tre, f

  # a c b  
  g = :mundane, :uncertain, :anomalous

  aspects = [
    [[a[0], a[0], a[0]], [a[0], a[0], c[0]], [a[0], a[0], b[0]]],
    [[c[0], c[0], a[0]], [c[0], c[0], c[0]], [c[0], c[0], b[0]]],
    [[b[0], b[0], a[0]], [b[0], b[0], c[0]], [b[0], b[0], b[0]]],
  ], [
    [[a[1], a[1], a[1]], [a[1], a[1], c[1]], [a[1], a[1], b[1]]],
    [[c[1], c[1], a[1]], [c[1], c[1], c[1]], [c[1], c[1], b[1]]],
    [[b[1], b[1], a[1]], [b[1], b[1], c[1]], [b[1], b[1], b[1]]],
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
  
  "#{current_symbol} : #{current_description}"
end

def governance(h, i, j, k, l, m, n)
  a = :governance,    h, 0.142857143 # What type of government structure
  b = :anamolous,     i, 0.142857143 # What type of anamolous events related to connectivity in objects.
  c = :psyop,         j, 0.142857143 # What way propaganda is delivered
  d = :individuality, k, 0.142857143 # What way is individuality expressed
  e = :schedule ,     l, 0.142857143 # What tightly controlled is the scheduling?
  f = :language,      m, 0.142857143 # How abusive is the language used.
  g = :normalcy,      n, 0.142857143 # How normal is situation for the location.

  financial_and_Schedule = [
    [[a[0], a[0], a[0], a[0], a[0], a[0], a[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], b[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], c[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], d[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], e[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], f[0]],
     [a[0], a[0], a[0], a[0], a[0], a[0], g[0]]],

    [[b[0], b[0], b[0], b[0], b[0], b[0], a[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], b[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], c[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], d[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], e[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], f[0]],
     [b[0], b[0], b[0], b[0], b[0], b[0], g[0]]],

    [[c[0], c[0], c[0], c[0], c[0], c[0], a[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], b[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], c[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], d[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], e[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], f[0]],
     [c[0], c[0], c[0], c[0], c[0], c[0], g[0]]],

    [[d[0], d[0], d[0], d[0], d[0], d[0], a[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], b[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], c[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], d[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], e[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], f[0]],
     [d[0], d[0], d[0], d[0], d[0], d[0], g[0]]],

    [[e[0], e[0], e[0], e[0], e[0], e[0], a[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], b[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], c[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], d[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], e[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], f[0]],
     [e[0], e[0], e[0], e[0], e[0], e[0], g[0]]],

    [[f[0], f[0], f[0], f[0], f[0], f[0], a[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], b[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], c[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], d[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], e[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], f[0]],
     [f[0], f[0], f[0], f[0], f[0], f[0], g][0]],

    [[g[0], g[0], g[0], g[0], g[0], g[0], a[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], b[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], c[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], d[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], e[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], f[0]],
     [g[0], g[0], g[0], g[0], g[0], g[0], g[0]]],
  ], [
    [[a[1], a[1], a[1], a[1], a[1], a[1], a[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], b[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], c[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], d[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], e[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], f[1]],
     [a[1], a[1], a[1], a[1], a[1], a[1], g[1]]],

    [[b[1], b[1], b[1], b[1], b[1], b[1], a[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], b[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], c[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], d[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], e[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], f[1]],
     [b[1], b[1], b[1], b[1], b[1], b[1], g[1]]],

    [[c[1], c[1], c[1], c[1], c[1], c[1], a[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], b[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], c[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], d[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], e[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], f[1]],
     [c[1], c[1], c[1], c[1], c[1], c[1], g[1]]],

    [[d[1], d[1], d[1], d[1], d[1], d[1], a[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], b[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], c[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], d[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], e[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], f[1]],
     [d[1], d[1], d[1], d[1], d[1], d[1], g[1]]],

    [[e[1], e[1], e[1], e[1], e[1], e[1], a[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], b[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], c[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], d[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], e[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], f[1]],
     [e[1], e[1], e[1], e[1], e[1], e[1], g[1]]],

    [[f[1], f[1], f[1], f[1], f[1], f[1], a[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], b[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], c[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], d[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], e[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], f[1]],
     [f[1], f[1], f[1], f[1], f[1], f[1], g][1]],

    [[g[1], g[1], g[1], g[1], g[1], g[1], a[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], b[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], c[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], d[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], e[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], f[1]],
     [g[1], g[1], g[1], g[1], g[1], g[1], g[1]]],
  ]

  symbols            = financial_and_Schedule[0]
  descriptions       = financial_and_Schedule[1]
  
  row_options = [0, 1, 2, 3, 4, 5, 6]
  col_options = [0, 1, 2, 3, 4, 5, 6]
  arr_options = [0, 1, 2, 3, 4, 5, 6]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  selection_probability = 0.142857143 * 0.142857143
  
  current_symbols     = symbols[cur_row][cur_col][cur_arr]
  current_description = descriptions[cur_row][cur_col][cur_arr]
  current_probability = 0.142857143 * 0.142857143 * 0.142857143
  
  current_information = current_symbols, current_description, current_probability
end

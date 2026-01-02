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

def quandquoicomme(a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,
                   d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5)
  
  scenarios = [
    [[a1, a1, a1, a1, a1],
     [a1, a1, a1, a1, a2],
     [a1, a1, a1, a1, a3],
     [a1, a1, a1, a1, a4],
     [a1, a1, a1, a1, a5]],
     
    [[a2, a2, a2, a2, a1],
     [a2, a2, a2, a2, a2],
     [a2, a2, a2, a2, a3],
     [a2, a2, a2, a2, a4],
     [a2, a2, a2, a2, a5]],

    [[a3, a3, a3, a3, a3],
     [a3, a3, a3, a3, a3],
     [a3, a3, a3, a3, a3],
     [a3, a3, a3, a3, a3],
     [a3, a3, a3, a3, a3]],

    [[a4, a4, a4, a4, a4],
     [a4, a4, a4, a4, a4],
     [a4, a4, a4, a4, a4],
     [a4, a4, a4, a4, a4],
     [a4, a4, a4, a4, a4]],
     
    [[a5, a5, a5, a5, a1],
     [a5, a5, a5, a5, a2],
     [a5, a5, a5, a5, a3],
     [a5, a5, a5, a5, a4],
     [a5, a5, a5, a5, a5]],
  ], [
    [[b1, b1, b1, b1, b1],
     [b1, b1, b1, b1, b2],
     [b1, b1, b1, b1, b3],
     [b1, b1, b1, b1, b4],
     [b1, b1, b1, b1, b5]],
     
    [[b2, b2, b2, b2, b1],
     [b2, b2, b2, b2, b2],
     [b2, b2, b2, b2, b3],
     [b2, b2, b2, b2, b4],
     [b2, b2, b2, b2, b5]],

    [[b3, b3, b3, b3, b3],
     [b3, b3, b3, b3, b3],
     [b3, b3, b3, b3, b3],
     [b3, b3, b3, b3, b3],
     [b3, b3, b3, b3, b3]],

    [[b4, b4, b4, b4, b4],
     [b4, b4, b4, b4, b4],
     [b4, b4, b4, b4, b4],
     [b4, b4, b4, b4, b4],
     [b4, b4, b4, b4, b4]],
     
    [[b5, b5, b5, b5, b1],
     [b5, b5, b5, b5, b2],
     [b5, b5, b5, b5, b3],
     [b5, b5, b5, b5, b4],
     [b5, b5, b5, b5, b5]],
  ], [
    [[c1, c1, c1, c1, c1],
     [c1, c1, c1, c1, c2],
     [c1, c1, c1, c1, c3],
     [c1, c1, c1, c1, c4],
     [c1, c1, c1, c1, c5]],
     
    [[c2, c2, c2, c2, c1],
     [c2, c2, c2, c2, c2],
     [c2, c2, c2, c2, c3],
     [c2, c2, c2, c2, c4],
     [c2, c2, c2, c2, c5]],

    [[c3, c3, c3, c3, c3],
     [c3, c3, c3, c3, c3],
     [c3, c3, c3, c3, c3],
     [c3, c3, c3, c3, c3],
     [c3, c3, c3, c3, c3]],

    [[c4, c4, c4, c4, c4],
     [c4, c4, c4, c4, c4],
     [c4, c4, c4, c4, c4],
     [c4, c4, c4, c4, c4],
     [c4, c4, c4, c4, c4]],
     
    [[c5, c5, c5, c5, c1],
     [c5, c5, c5, c5, c2],
     [c5, c5, c5, c5, c3],
     [c5, c5, c5, c5, c4],
     [c5, c5, c5, c5, c5]],
  ], [
    [[d1, d1, d1, d1, d1],
     [d1, d1, d1, d1, d2],
     [d1, d1, d1, d1, d3],
     [d1, d1, d1, d1, d4],
     [d1, d1, d1, d1, d5]],
     
    [[d2, d2, d2, d2, d1],
     [d2, d2, d2, d2, d2],
     [d2, d2, d2, d2, d3],
     [d2, d2, d2, d2, d4],
     [d2, d2, d2, d2, d5]],

    [[d3, d3, d3, d3, d3],
     [d3, d3, d3, d3, d3],
     [d3, d3, d3, d3, d3],
     [d3, d3, d3, d3, d3],
     [d3, d3, d3, d3, d3]],

    [[d4, d4, d4, d4, d4],
     [d4, d4, d4, d4, d4],
     [d4, d4, d4, d4, d4],
     [d4, d4, d4, d4, d4],
     [d4, d4, d4, d4, d4]],
     
    [[d5, d5, d5, d5, d1],
     [d5, d5, d5, d5, d2],
     [d5, d5, d5, d5, d3],
     [d5, d5, d5, d5, d4],
     [d5, d5, d5, d5, d5]],
  ], [
    [[e1, e1, e1, e1, e1],
     [e1, e1, e1, e1, e2],
     [e1, e1, e1, e1, e3],
     [e1, e1, e1, e1, e4],
     [e1, e1, e1, e1, e5]],
     
    [[e2, e2, e2, e2, e1],
     [e2, e2, e2, e2, e2],
     [e2, e2, e2, e2, e3],
     [e2, e2, e2, e2, e4],
     [e2, e2, e2, e2, e5]],

    [[e3, e3, e3, e3, e3],
     [e3, e3, e3, e3, e3],
     [e3, e3, e3, e3, e3],
     [e3, e3, e3, e3, e3],
     [e3, e3, e3, e3, e3]],

    [[e4, e4, e4, e4, e4],
     [e4, e4, e4, e4, e4],
     [e4, e4, e4, e4, e4],
     [e4, e4, e4, e4, e4],
     [e4, e4, e4, e4, e4]],
     
    [[e5, e5, e5, e5, e1],
     [e5, e5, e5, e5, e2],
     [e5, e5, e5, e5, e3],
     [e5, e5, e5, e5, e4],
     [e5, e5, e5, e5, e5]],
  ], [
    [[f1, f1, f1, f1, f1],
     [f1, f1, f1, f1, f2],
     [f1, f1, f1, f1, f3],
     [f1, f1, f1, f1, f4],
     [f1, f1, f1, f1, f5]],
     
    [[f2, f2, f2, f2, f1],
     [f2, f2, f2, f2, f2],
     [f2, f2, f2, f2, f3],
     [f2, f2, f2, f2, f4],
     [f2, f2, f2, f2, f5]],

    [[f3, f3, f3, f3, f3],
     [f3, f3, f3, f3, f3],
     [f3, f3, f3, f3, f3],
     [f3, f3, f3, f3, f3],
     [f3, f3, f3, f3, f3]],

    [[f4, f4, f4, f4, f4],
     [f4, f4, f4, f4, f4],
     [f4, f4, f4, f4, f4],
     [f4, f4, f4, f4, f4],
     [f4, f4, f4, f4, f4]],
     
    [[f5, f5, f5, f5, f1],
     [f5, f5, f5, f5, f2],
     [f5, f5, f5, f5, f3],
     [f5, f5, f5, f5, f4],
     [f5, f5, f5, f5, f5]],
  ]
  
  row_options = [0, 1, 2, 3, 4]
  col_options = [0, 1, 2, 3, 4]
  arr_options = [0, 1, 2, 3, 4]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  say_when     = scenarios[0]
  say_what     = scenarios[1]
  say_how      = scenarios[2]
  say_cette    = scenarios[3]
  say_maisette = scenarios[4]
  say_sinon    = scenarios[5]
  
  ## Investigative specifics
  current_time   = say_when[cur_row][cur_col][cur_arr]
  current_action = say_what[cur_row][cur_col][cur_arr]
  current_manner = say_how[cur_row][cur_col][cur_arr]
  
  ## Specific Conditional scenarios
  current_cette    = say_cette[cur_row][cur_col][cur_arr]
  current_maisette = say_maisette[cur_row][cur_col][cur_arr]
  current_sinon    = say_sinon[cur_row][cur_col][cur_arr]
  
  $current_case = current_time, current_action, current_manner, current_cette, current_maisette, current_sinon
end

def quiquandquoi(g, h, i, j, k, l)
  # "Anatta"
  # "travail avec il velo a l'ecole."
  # "En le heure de 6:00 A.M."

  # cette(velo, rouge)
  # maisette(lecole, vert)
  # sinon(route, rouge, vert)

  a = :who,  g
  b = :what, h
  c = :when, i

  d = :cette,    j
  e = :maisette, k
  f = :sinon,    l

  core_knowledge = [
    [[a, a, a],
     [a, a, b],
     [a, a, c]],
   
    [[b, b, a],
     [b, b, b],
     [b, b, c]],
   
    [[c, c, a],
     [c, c, b],
     [c, c, c]],
  ], [
    [[d, d, d],
     [d, d, e],
     [d, d, f]],
   
    [[e, e, d],
     [e, e, e],
     [e, e, f]],

    [[f, f, d],
     [f, f, e],
     [f, f, f]],
  ]

  who_what_when        = core_knowledge[0]
  cette_maisette_sinon = core_knowledge[1]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  say_what    = who_what_when[cur_row][cur_col][cur_arr]
  new_outcome = cette_maisette_sinon[cur_row][cur_col][cur_arr]
  
  $datapoint = say_what, new_outcome
end

## When it happened and who did it, and that-but that-otherwise
def quandqui(a, b, c, d, e)
  f = :when, a
  g = :who,  b
  
  h = :cette,    c
  i = :maisette, d
  j = :sinon,    e

  core_knowledge = [
    [[f, f],
     [f, g]],
     
    [[g, f],
     [g, g]],
  ], [
    [[h, h, h],
     [h, h, i],
     [h, h, j]],
     
    [[i, i, h],
     [i, i, i],
     [i, i, j]],
     
    [[j, j, h],
     [j, j, i],
     [j, j, j]],
  ]
  
  when_who    = core_knowledge[0]
  new_outcome = core_knowledge[1]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  say_what    = when_who[cur_row][cur_col][cur_arr]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  cette_maisette_sinon = new_outcome[cur_row][cur_col][cur_arr]
  
  $datapoint = say_what, cette_maisette_sinon
  
  puts $datapoint
end

def quoisi(a, b)
  c = :quoi, a
  d = :si,   b

  core_knowledge = [
    [[c[0], c[0]],
     [c[0], d[0]]],
     
    [[d[0], c[0]],
     [d[0], d[0]]],
  ], [
    [[c[1], c[1]],
     [c[1], d[1]]],
     
    [[d[1], c[1]],
     [d[1], d[1]]],
  ]
  
  current_labels   = core_knowledge[0]
  specific_objects = core_knowledge[1]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  this_label  = current_labels[cur_row][cur_col][cur_arr]
  this_object = specific_objects[cur_row][cur_col][cur_arr]

  puts "Quoi si #{a} est #{b}: Ce #{this_object} est #{this_label}."
  
  $quoisi = "Quoi si #{a} est #{b}: Ce #{this_object} est #{this_label}."
end

# Asks who, what, and contrasting language. Then isolates a datapoint.
def quiquoi(a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, e1, e2, e3)

  h = :who,      a1, a2, a3
  i = :what,     b1, b2, b3
  j = :cette,    c1, c2, c3
  k = :maisette, d1, d2, d3
  l = :sinon,    e1, e2, e3

  core_knowledge = [
    [[a1, a1],
     [b1, b1],
     [c1, c1],
     [d1, d1],
     [e1, e1]],
     
    [[a2, a2],
     [b2, b2],
     [c2, c2],
     [d2, d2],
     [e2, e2]],

    [[a3, a3],
     [b3, b3],
     [c3, c3],
     [d3, d3],
     [e3, e3]],
  ]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  @current_datapoint = core_knowledge[cur_row][cur_col][cur_arr]
  
  puts @current_datapoint
end

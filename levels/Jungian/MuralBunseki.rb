# Analyze painting or mural
def muralebunseki(a, b)
  "Vous avoir analyse #{a} en repos en #{b}."
end

# Analyze up to three paintings
def analyze_muralebunseki(a, b, c)
  require "NeoPathfinding"
  
  2.times do
    get_statistics(:first_mural,  a,
                   :second_mural, b,
                   :third_mural,  c)
                 
                   dynamic_reward_allocation
  end
end

# Salut and Gaka, or salute the painter, or specifically their painting.
def salugaka
  "Vous avoir salute #{a} en photo de #{b}."
end

# Analyze up to three saluted painters.
def analyze_salugaka(a, b, c)
  require "NeoPathfinding"
  
  2.times do
    get_statistics(:first_salut,  a,
                   :second_salut, b,
                   :third_salut,  c)
                 
                   dynamic_reward_allocation
  end
end

def isolate_mural(a, b, c)
  require "NeoPathfinding"
  require "SelfModifiedDecisionTree"

  mural_traits = RevisedBayes(:no_linework,  :some_linework,  :mild_linework,  :medium_linework,  :high_linework),
                 RevisedBayes(:no_grout,     :some_grout,     :mild_grout,     :medium_grout,     :high_grout),
                 RevisedBayes(:no_brushwork, :some_brushwork, :mild_brushwork, :medium_brushwork, :high_brushwork),
                 RevisedBayes(:no_yellowing, :some_yellowing, :mild_yellowing, :medium_yellowing, :high_yellowing)

  linework  = mural_traits[0]
  grout     = mural_traits[1]
  brushwork = mural_traits[2]
  yellowing = mural_traits[3]
  
  ## Classify Linework
  linework.train(:no_linework,           "There is no amount of linework in this mural or painting.",     "no linework")
  linework.train(:some_linework,       "There is some amount of linework in this mural or painting.",   "some linework")
  linework.train(:mild_linework,     "There is a mild amount of linework in this mural or painting.",   "mild linework")
  linework.train(:medium_linework, "There is a medium amount of linework in this mural or painting.", "medium linework")
  linework.train(:high_linework,     "There is a high amount of linework in this mural or painting.",   "high linework")
  
  ## Classify Grout
  grout.train(:no_linework,           "There is no amount of grout in this mural or painting.",     "no grout")
  grout.train(:some_linework,       "There is some amount of grout in this mural or painting.",   "some grout")
  grout.train(:mild_linework,     "There is a mild amount of grout in this mural or painting.",   "mild grout")
  grout.train(:medium_linework, "There is a medium amount of grout in this mural or painting.", "medium grout")
  grout.train(:high_linework,     "There is a high amount of grout in this mural or painting.",   "high grout")
  
  ## Classify Brushwork
  brushwork.train(:no_linework,           "There is no amount of brushwork in this mural or painting.",     "no brushwork")
  brushwork.train(:some_linework,       "There is some amount of brushwork in this mural or painting.",   "some brushwork")
  brushwork.train(:mild_linework,     "There is a mild amount of brushwork in this mural or painting.",   "mild brushwork")
  brushwork.train(:medium_linework, "There is a medium amount of brushwork in this mural or painting.", "medium brushwork")
  brushwork.train(:high_linework,     "There is a high amount of brushwork in this mural or painting.",   "high brushwork")
  
  ## Classify Yellowing
  yellowing.train(:no_linework,           "There is no amount of yellowing in this mural or painting.",     "no yellowing")
  yellowing.train(:some_linework,       "There is some amount of yellowing in this mural or painting.",   "some yellowing")
  yellowing.train(:mild_linework,     "There is a mild amount of yellowing in this mural or painting.",   "mild yellowing")
  yellowing.train(:medium_linework, "There is a medium amount of yellowing in this mural or painting.", "medium yellowing")
  yellowing.train(:high_linework,     "There is a high amount of yellowing in this mural or painting.",   "high yellowing")
  
  ### Classification
  linework_classification1  = linework.classify(a)
  grout_classification1     = grout.classify(a)
  brushwork_classification1 = brushwork.classify(a)
  yellowing_classification1 = yellowing.classify(a)

  linework_classification2  = linework.classify(b)
  grout_classification2     = grout.classify(b)
  brushwork_classification2 = brushwork.classify(b)
  yellowing_classification2 = yellowing.classify(b)

  linework_classification3  = linework.classify(c)
  grout_classification3     = grout.classify(c)
  brushwork_classification3 = brushwork.classify(c)
  yellowing_classification3 = yellowing.classify(c)

  2.times do
    get_statistics(:first_linework,  linework_classification1[0],
                   :second_linework, linework_classification2[0],
                   :third_linework,  linework_classification3[0])
                 
                   dynamic_reward_allocation
  end
  
  2.times do
    get_statistics(:first_grout,  grout_classification1[0],
                   :second_grout, grout_classification2[0],
                   :third_grout,  grout_classification3[0])
                 
                   dynamic_reward_allocation
  end

  2.times do
    get_statistics(:first_brushwork,  brushwork_classification1[0],
                   :second_brushwork, brushwork_classification2[0],
                   :third_brushwork,  brushwork_classification3[0])
                 
                   dynamic_reward_allocation
  end
  
  2.times do
    get_statistics(:first_yellowing,  yellowing_classification1[0],
                   :second_yellowing, yellowing_classification2[0],
                   :third_yellowing,  yellowing_classification3[0])
                 
                   dynamic_reward_allocation
  end
end

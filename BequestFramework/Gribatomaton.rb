module GribatomatonAdvanced
  class PetSpider
    def self.actions
      behaviours = [
        [[true,  true], [true,  false]],
        [[false, true], [false, false]],
      ], [
        [[true,  true], [true,  false]],
        [[false, true], [false, false]],
      ], [
        [[true,  true], [true,  false]],
        [[false, true], [false, false]],
      ]

      spot_enemy      = behaviours[0]
      make_noises     = behaviours[1]
      shine_spotlight = behaviours[2]

      ## Spotting Enemy
      row_options_s1 = [0, 1]
      col_options_s1 = [0, 1]
      arr_options_s1 = [0, 1]

      cur_row_s1 = row_options_s1.sample
      cur_col_s1 = col_options_s1.sample
      cur_arr_s1 = arr_options_s1.sample

      ## Noises Making
      row_options_m  = [0, 1]
      col_options_m  = [0, 1]
      arr_options_m  = [0, 1]

      cur_row_m = row_options_m.sample
      cur_col_m = col_options_m.sample
      cur_arr_m = arr_options_m.sample

      ## Shining Spotlight
      row_options_s2 = [0, 1]
      col_options_s2 = [0, 1]
      arr_options_s2 = [0, 1]

      cur_row_s2 = row_options_s2.sample
      cur_col_s2 = col_options_s2.sample
      cur_arr_s2 = arr_options_s2.sample

      ### Actual Behaviours
      spider_spot   = spot_enemy[cur_row_s1][cur_col_s1][cur_arr_s1]
      spider_chirbu = spot_enemy[cur_row_m][cur_col_m][cur_arr_m]
      spider_shine  = spot_enemy[cur_row_s2][cur_col_s2][cur_arr_s2]

      if spider_spot == true
        puts "The spider has spotted an enemy..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider has spotted an enemy..."
        }
      else
        puts "The spider has not spotted an enemy..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider has not spotted an enemy..."
        }
      end

      sleep(1.5)

      if spider_chirbu == true
        puts "The spider goes chirbu chirbu chirbu..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider goes chirbu chirbu chirbu..."
        }
      else
        puts "The spider hisses..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider hisses..."
        }
      end

      sleep(1.5)

      if spider_shine == true
        puts "The spider shines its antenas..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider shines its antenas..."
        }
      else
        puts "The spider remains in the dark passage..."

        File.open("data/gribatomaton/behaviours.txt", "a") { |f|
          f.puts "The spider remains in the dark passage..."
        }
      end

      sleep(1.5)

      #GribatomatonAdvanced::StatisticalLabels.evaluate_behaviours
    end
  end
  
  class EvaluateBehaviours
    def self.evaluate_behaviours
      require "SelfModifiedDecisionTree"

      behaviours = NaiveBayes.new(:active, :passive)

      ## Active
      behaviours.train(:active,      "The spider has spotted an enemy...", "spotting")
      behaviours.train(:active, "The spider goes chirbu chirbu chirbu...", "chirping")
      behaviours.train(:active,        "The spider shines its antenas...",  "shining")

      ## Passive
      behaviours.train(:passive,    "The spider has not spotted an enemy...",   "unseen")
      behaviours.train(:passive,                      "The spider hisses...",   "hisses")
      behaviours.train(:passive, "The spider remains in the dark passage...", "darkness")

      new_behaviours = File.readlines("data/gribatomaton/behaviours.txt")
      size_limit     = new_behaviours.size.to_i
      index          = 0

      size_limit.times do
        classification = behaviours.classify(new_behaviours[index])

        require "decisiontree"

        attributes = ["Behaviours"]

        training = [
          [0.1250,     "No Risk"],
          [0.3435,   "Mild Risk"],
          [0.5620, "Medium Risk"],
          [0.7805,   "High Risk"],
          [0.9990,    "Max Risk"],
        ]

        dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)

        current_dectree = dec_tree
        current_dectree.train

        test = [classification[1], "Medium Risk"]
        decision = dec_tree.predict(test)

        puts "Predicted: Compared to #{test.last}, #{decision}"

        index = index + 1

        sleep(1.5)        
      end
    end
  end
end

module BequestDietiesPlayer
  class Worship
    def self.worship_dakupreiste
      god_favor = [
        [["favor",    "favor"], ["favor", "disfavor"]],
        [["disfavor", "favor"], ["disfavor", "favor"]],
      ]

      row_options = [0, 1]
      col_options = [0, 1]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_favor = god_favor[cur_row][cur_col][cur_arr]

      if    current_favor ==    "favor"; StealthDieties::DietyPower.dakupreiste_reward
      elsif current_favor == "disfavor"; StealthDieties::DietyPower.dakupreiste_punish
      end
    end

    def self.worship_mort_naussance
      god_favor = [
        [["favor",    "favor"], ["favor", "disfavor"]],
        [["disfavor", "favor"], ["disfavor", "favor"]],
      ]

      row_options = [0, 1]
      col_options = [0, 1]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_favor = god_favor[cur_row][cur_col][cur_arr]

      if    current_favor ==    "favor"; StealthDieties::DietyPower.mort_naussance_reward
      elsif current_favor == "disfavor"; StealthDieties::DietyPower.mort_naussance_punish
      end
    end

    def self.bourreau_de_karma
      god_favor = [
        [["favor",    "favor"], ["favor", "disfavor"]],
        [["disfavor", "favor"], ["disfavor", "favor"]],
      ]

      row_options = [0, 1]
      col_options = [0, 1]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_favor = god_favor[cur_row][cur_col][cur_arr]

      if    current_favor ==    "favor"; StealthDieties::DietyPower.bourreau_de_karma_reward
      elsif current_favor == "disfavor"; StealthDieties::DietyPower.bourreau_de_karma_punish 
      end
    end

    def self.horyo_de_noir
      god_favor = [
        [["favor",    "favor"], ["favor", "disfavor"]],
        [["disfavor", "favor"], ["disfavor", "favor"]],
      ]

      row_options = [0, 1]
      col_options = [0, 1]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_favor = god_favor[cur_row][cur_col][cur_arr]

      if    current_favor ==    "favor"; StealthDieties::DietyPower.horyo_de_noir_reward
      elsif current_favor == "disfavor"; StealthDieties::DietyPower.horyo_de_noir_punish
      end
    end
  end

  #################################################################################
  #                        Standard Rewards And Punishments                       #
  #################################################################################
  # Standard rewards and punishments that may evntually be replaced by a sanity   #
  # or trust detriment. While sometimes also having a random curse status effect. #
  #################################################################################
  class DietyPower

    # dakupreiste
    def self.dakupreiste_reward
    end

    def self.dakupreiste_punish
      puts "< The dark priest curses you and you turn into a vampire."
    end

    # mort naussance
    def self.mort_naussance_reward
    end

    def self.mort_naussance_punish
      puts "< The karada duplicata curses you to have every baby be stillborn."
    end

    # borreau de karma
    def self.bourreau_de_karma_reward
    end

    def self.bourreau_de_karma_punish
      puts "< The eexecutioner of karma chops your head off."

      puts "GAMEOVER"

      abort
    end

    # horyo_de_noir
    def self.horyo_de_noir_reward
    end

    def self.horyo_de_noir_punish
      puts "< The prisoner in black tries to stab you in the back."
    end

  end

  #################################################################################
  #                    Outside of standard worship sequences                      #
  #################################################################################
  # Sometimes in battles you might have a random status effect from a different   #
  # diety that gives you a distinct drawback that you have to manage.             #
  #################################################################################
  class DietyCurse
    def self.vampire_curse
      puts "The dark preist curses you into becoming a vampire."
    end

    def self.doll_curse
      puts "The haunted doll curses you into becoming a porcelain doll."
    end

    def self.living_purgatory
      puts "The executioner of karma does not give you the release of Saint Peter."
    end

    def self.bleeding_yen
      puts "You lost some yen. You lose yen every turn."
    end

    def self.curse_dice
      #            vampire  doll  purgatory  bleedingy
      # vampire    v,v      v,d   v,p        v,b
      # doll       d,v      d,d   d,p        d,b
      # purgatory  p,v      p,d   p,p        p,b
      # bleedingy  b,v      b,d   b,p        b,b

      curse_effects = [
        [["vampire",      "vampire"], ["vampire",     "doll"], ["vampire",      "purgatory"], ["vampire",      "bleeding yen"]],
        [["doll",         "vampire"], ["doll",        "doll"], ["doll",         "purgatory"], ["doll",         "bleeding yen"]],
        [["purgatory",    "vampire"], ["purgatory",   "doll"], ["purgatory",    "purgatory"], ["purgatory",    "bleeding yen"]],
        [["bleeding yen", "vampire"], ["bleedng yen", "doll"], ["bleeding yen", "purgatory"], ["bleeding yen", "bleeding yen"]],
      ]

      row_options = [0, 1, 2, 3]
      col_options = [0, 1, 2, 3]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_curse = curse_effects[cur_row][cur_col][cur_arr]

      if    current_curse ==      "vampire"; StealthMutations::DietyCurses.vampire_curse
      elsif current_curse ==         "doll"; StealthMutations::DietyCurses.doll_curse
      elsif current_curse ==    "purgatory"; StealthMutations::DietyCurses.living_purgatory
      elsif current_curse == "bleeding yen"; StealthMutations::DietyCurses.bleeding_yen
      else
      end
    end
  end
end

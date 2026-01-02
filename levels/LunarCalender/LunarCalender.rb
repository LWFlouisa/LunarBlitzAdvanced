module BequestCalender
  class LunarSeason
    ######################################################################################
    #                                    Lunar Calender                                  #
    ######################################################################################
    # This establishes the basic mechanics of the Lunar Calender system that modifies    #
    # the player's base metrics on what the current lunar phase, with it being more      #
    # advised to switch to stealth mechanics during the time they are weakest, then      #
    # using the Gribatomaton for when the lunar phase when Bear Men and Kumabatto poses  #
    # the least challenge to them.                                                       #
    #                                                                                    #
    # It remains to be seen whether this will continue to be relevant as I refine this   #
    # this stealth RPG framework.                                                        #
    ######################################################################################

    def self.global_stats
      # Standard Operations
      $stalemates    = 0 # Keeps track of how many stalemates
      $player_struck = 0 # Keeps track of how many times player hit the enemy.
      $enemy_struck  = 0 # Keeps track of how many times enemy hit the player.

      # Amount of days in a year.
      $current_day = 0
      $lunar_ticks = 30

      ## Current Lunar Phase
      $current_phase = 0

      $player_level = 1
      $enemy_level  = 1

      # Yes or no spider
      $has_pet_spider = false

      $cleaned           = 0 # Amount your clean up crew cleaned.
      $contamination     = 0 # Contamination spread.
      #$day_counter       = 0 # Thirty days before the next lunar shift.
      $zombies           = 0 # How many zombies you bludgeons or strangled.
    end

    def self.enemy_name
      # ~~~
      # 10 => 20 => 30 New Moon
      #  9 => 18 => 27 Waxing Crescent
      #  7 => 14 => 21 First Quarter
      #  6 => 12 => 18 Waxing Gibbous
      #  4 =>  8 => 12 Full Moon
      #  6 => 12 => 18 Waning Gibbous
      #  7 => 14 => 21 Last Quarter
      #  8 => 16 => 24 Waning Crescent
      # ~~

      # Lunar Phases In French
      nl  =       "nouvelle lune"; clc = "croissant A La cire"; 
      pt  =   "premier trimestre";     cdg = "cire de Gibbous";
      pl  =         "Pleine Lune"; eg  =   "evetement gibbous";
      dt  =   "dernier trimestre"; af  =             "aurfeur";

      # Fauna Names In Nihongo
      attc =   "Anos Tsuchi Tesutosujettos de les corrompue"
      aduc =        "Anos Denki Ursinehomme de le carbonise"
      asur =            "Ana Shi Ursinehomme de le recupere"
      atun =            "Ana Tsuchi Ursinehomme de la noyee"
      aeun =                "Anos Ea Ursinehomme de le noye"
      adts =       "Anos Denki Tesutosujettos de le souffle"
      attn =         "Ana Tsuchi Tesutosujettos de la noyee"
      athn =      "Anos Tenchi Homard Au Cochon de la noyee"
      adtc =    "Anos Denki Tesutosujettos de les corrompue"
      adua =       "Anos Danki Usinehomme de les abandonnes"
      atuc =      "Anos Tenchi Ursinehomme de les corrompue"
      adha = "Anos Denki Homard Au Cochon de les abandonnes"

      lunar_fauna = [
        [[attc, attc], [attc, aduc], [attc, asur], [attc, atun], [attc, aeun], [attc, adts], [attc, attn], [attc, athn], [attc, adtc], [attc, adua], [attc, atuc], [attc, adha]],
        [[aduc, attc], [aduc, aduc], [aduc, asur], [aduc, atun], [aduc, aeun], [aduc, adts], [aduc, attn], [aduc, athn], [aduc, adtc], [aduc, adua], [aduc, atuc], [aduc, adha]],
        [[asur, attc], [asur, aduc], [asur, asur], [asur, atun], [asur, aeun], [asur, adts], [asur, attn], [asur, athn], [asur, adtc], [asur, adua], [asur, atuc], [asur, adha]],
        [[atun, attc], [atun, aduc], [atun, asur], [atun, atun], [atun, aeun], [atun, adts], [atun, attn], [atun, athn], [atun, adtc], [atun, adua], [atun, atuc], [atun, adha]],
        [[aeun, attc], [aeun, aduc], [aeun, asur], [aeun, atun], [aeun, aeun], [aeun, adts], [aeun, attn], [aeun, athn], [aeun, adtc], [aeun, adua], [aeun, atuc], [aeun, adha]],
        [[adts, attc], [adts, aduc], [adts, asur], [adts, atun], [adts, aeun], [adts, adts], [adts, attn], [adts, athn], [adts, adtc], [adts, adua], [adts, atuc], [adts, adha]],
        [[attn, attc], [attn, aduc], [attn, asur], [attn, atun], [attn, aeun], [attn, adts], [attn, attn], [attn, athn], [attn, adtc], [attn, adua], [attn, atuc], [attn, adha]],
        [[athn, attc], [athn, aduc], [athn, asur], [athn, atun], [athn, aeun], [athn, adts], [athn, attn], [athn, athn], [athn, adtc], [athn, adua], [athn, atuc], [athn, adha]],
        [[adtc, attc], [adtc, aduc], [adtc, asur], [adtc, atun], [adtc, aeun], [adtc, adts], [adtc, attn], [adtc, athn], [adtc, adtc], [adtc, adua], [adtc, atuc], [adtc, adha]],
        [[adua, attc], [adua, aduc], [adua, asur], [adua, atun], [adua, aeun], [adua, adts], [adua, attn], [adua, athn], [adua, adtc], [adua, adua], [adua, atuc], [adua, adha]],
        [[atuc, attc], [atuc, aduc], [atuc, asur], [atuc, atun], [atuc, aeun], [atuc, adts], [atuc, attn], [atuc, athn], [atuc, adtc], [atuc, adua], [atuc, atuc], [atuc, adha]],
        [[adha, attc], [adha, aduc], [adha, asur], [adha, atun], [adha, aeun], [adha, adts], [adha, attn], [adha, athn], [adha, adtc], [adha, adua], [adha, atuc], [adha, adha]],
      ]

      # Fauna Type
      row_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
      col_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      $fauna_type = lunar_fauna[cur_row][cur_col][cur_arr]
    end

    def self.new_moon
      $player_sanity = 10 * $player_level
      $player_hp     = 10 * $player_level
      $player_atk    =  2 * $player_level
      $player_heal   =  2 * $player_level

      $enemy_sanity =  2 * $enemy_level
      $enemy_hp     =  2 * $enemy_level
      $enemy_atk    = 10 * $enemy_level # player gets 5 damage when factoring in healing rate.

      $lunar_phase = "Le phase lunaire es Nouvelle Luna."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waxing_crescent
      $player_sanity = 9 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level

      $enemy_sanity = 4 * $enemy_level
      $enemy_hp     = 4 * $enemy_level
      $enemy_atk    = 8 * $enemy_level # Player gets exactly 4 damage when factoring in healing rate as defence.

      $lunar_phase = "Le phase lunaire es Croissant A La Cire."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.first_quarter
      $player_sanity = 7 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level

      $enemy_sanity = 6 * $enemy_level
      $enemy_hp     = 6 * $enemy_level
      $enemy_atk    = 6 * $enemy_level # player gets 3 damage when factoring in healing rate.

      $lunar_phase = "Le phase lunaire es Premier Trimestre."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waxing_gibbous
      $player_sanity = 6 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level

      $enemy_sanity  = 8 * $enemy_level
      $enemy_hp      = 8 * $enemy_level
      $enemy_atk     = 4 * $enemy_level # Player gets exactly 2 Damage when factoring in healing as defence. 

      $lunar_phase = "Le phase lunaire es Cire De Gibbous."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.full_moon
      $player_sanity = 4 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level

      $enemy_sanity = 10 * $enemy_level
      $enemy_hp     = 10 * $enemy_level
      $enemy_atk    =  2 * $enemy_level # Player gets exactly 1 damage when factoring in healing rate as defence.

      $lunar_phase = "Le phase lunaire es Pleine Lune."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waning_gibbous
      $player_sanity = 6 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level

      $enemy_sanity = 8 * $enemy_level
      $enemy_hp     = 8 * $enemy_level
      $enemy_atk    = 4 * $enemy_level # Player gets exactly 2 damage when factoring in healing as defence.

      $lunar_phase = "Le phase lunaire es Evetement Gibbous."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.last_quarter
      $player_sanity = 7 * $player_level
      $player_atk    = 2 * $player_level

      $enemy_sanity = 4 * $enemy_level
      $enemy_hp     = 4 * $enemy_level
      $enemy_atk    = 6 * $enemy_level # Player gets exactly 3 damage when factoring in healing as defence.

      $lunar_phase = "Le phase lunaire es Dernier trimestre."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waning_crescent
      $player_sanity = 8 * $player_level
      $player_atk    = 2 * $player_level
      $player_heal   = 2 * $player_level # player gets exactly 4 damage when factoring in healing as defence.

      $enemy_sanity = 2 * $enemy_level
      $enemy_hp     = 2 * $enemy_level
      $enemy_atk    = 8 * $enemy_level

      $lunar_phase = "Le phase lunaire es Aurfeur."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.lunar_cycle
      lunar_phases = [0, 1, 2, 3, 4, 5, 6, 7]

      # The current lunar phase mod 7
      current_phase  = $current_phase % 7
      #$current_phase = $current_phase + 1 % 7

      if    current_phase == lunar_phases[0]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: New Moon. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.new_moon
      elsif current_phase == lunar_phases[1]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waxing_crescent
      elsif current_phase == lunar_phases[2]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.first_quarter
      elsif current_phase == lunar_phases[3]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: First Quarter. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waxing_gibbous
      elsif current_phase == lunar_phases[4]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Full_moon. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.full_moon
      elsif current_phase == lunar_phases[5]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waning_gibbous
      elsif current_phase == lunar_phases[6]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Last Quarter. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.last_quarter
      elsif current_phase == lunar_phases[7]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Crescent. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waning_crescent
      end

      sleep(1.5)
    end

    def self.player_gui
      puts "\e[38;2;187;127;118mLunar Phase: #{$enemy_name}\nLunar Ticks: #{$lunar_ticks} Current Day: #{$current_day}\n\n"
      puts "\e[38;2;187;127;118mCleaned: #{$cleaned} Contaminatiion: #{$contamination}"
	  
      puts "\e[38;2;187;127;118mPlayer Level:  #{$player_level}"
      puts "\e[38;2;187;127;118mPlayer Sanity: #{$player_sanity}"
      puts "\e[38;2;187;127;118mPlayer HP:     #{$player_hp}"
      puts "\e[38;2;187;127;118mPlayer ATK:    #{$player_atk}"
      puts "\e[38;2;187;127;118mPlayer HEAL:   #{$player_heal}"
      puts "\e[38;2;187;127;118mPet Spider?:   #{$has_pet_spider}\n\n"
      puts "\e[38;2;187;127;118mEnemy Sanity:  #{$enemy_sanity}"
      puts "\e[38;2;187;127;118mEnemy HP:      #{$enemy_hp}"
      puts "\e[38;2;187;127;118mEnemy ATK:     #{$enemy_atk}\n\n"
	  
      puts "\e[38;2;187;127;118mPlayer: #{$player_quip}"
      puts "\e[38;2;187;127;118m#{$fauna_type}: #{$enemy_quip}\n\n"
    end
  end
end

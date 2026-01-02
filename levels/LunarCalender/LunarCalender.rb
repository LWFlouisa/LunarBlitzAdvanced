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

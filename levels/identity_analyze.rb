require_relative "Jungian/dreams.rb"

class Bandit
  def self.positive_metrics
    require "NeoPathfinding"

    puts "NOM DE PLUME"
    analyze_nom("Derek", "Francois", "Dereko")

    puts "PREFERRED WEAPON"
    analyze_buttai("Epee", "Ishi", "Bache")

    puts "PREFERRED HOURS"
    analyze_temps("Minuit", "Yoake", "Midi")

    puts "PREFERRED LOCALES"
    analyze_fukin("Cafe", "Hottotabu", "Librarie")
  end

  def self.negative_metrics
    require "NeoPathfinding"

    puts "NOM DE PLUME EN NEGATIF"
    analyze_ninom("Francois", "Derek", "Adelle")

    puts "PREFERRED WEAPON EN NEGATIF"
    analyze_nibuttai("Ishi", "Bache", "Ken")

    puts "PREFERRED HOURS EN NEGATIF"
    analyze_netemps("Yonaka", "Apres-Midi", "Yugure")

    puts "PREFERRED LOCALES EN NEGATIF"
    analyze_fukin("Kafe", "Spa", "Toshokan")
  end

  def self.engineer_bandito
    puts "Determing positive space profile of bandit..."
    Bandit.positive_metrics

    puts "Determing negative space profile of bandit..."
    Bandit.negative_metrics
  end
end

def identify_pirate
  require "NeoPathfinding"
end

def identify_villager
  require "NeoPathfinding"
end

def identify_monster
  require "NeoPathfinding"
end

def identify_maid
  require "NeoPathfinding"
end

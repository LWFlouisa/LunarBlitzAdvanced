module BequestMerchant
  class LocaleFeatures
    def self.choose_features
      ethno_style = [
        [["jp", "jp"], ["jp", "fr"]],
        [["fr", "jp"], ["fr", "fr"]],
      ]

      ethno_feature = [
        [["woven mats",         "woven mats"], ["woven mats",          "ornate chandeliers"]],
        [["ornate chandeliers", "woven mats"], ["ornate chanedeliers", "ornate chandeliers"]],
      ]

      row_options = [0, 1]
      col_options = [0, 1]
      arr_options = [0, 1]

      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample

      current_style = ethno_style[cur_row][cur_col][cur_arr]

      if    current_style == "jp"
        puts "You are magically transported to a vaguely moden Japanese styled city."

        $chosen_feature = ethno_feature[cur_row][cur_col][cur_arr]

        BequestMerchant::LocaleFeatures.modern_japanese
      elsif current_style == "fr"
        puts "You are magically transported to a vaguely belle epoque styled city."

        $chosen_feature = ethno_feature[cur_row][cur_col][cur_arr]

        BequestMerchant::LocaleFeatures.belle_epoque
      else
        puts "Your locations is currently known only to the Lunar Goddess."

        $chosen_feature = ethno_feature[cur_row][cur_col][cur_arr]

        BequestMerchant::LocaleFeatures.unknown_feature
      end
    end

    def self.modern_japanese
      puts "People drive on the right side of the road."
    end

    def self.belle_epoque
      puts "People drive on the left side of the road."
    end

    def self.unknown_feature
      puts "Nobody drives on any side of the road do to people riding horses.."
    end
  end

  class Inn
    def self.initialize
      @yen     = File.read("lib/player/currency/value_of_yen.txt").to_i
      @franc   = File.read("lib/player/currency/value_of_franc.txt").to_i
      @lunario = File.read("lib/player/currency/value_of_lunario.txt").to_i

      @shoe_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_shoe_hp = 50

      @player_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_player_hp = 125
    end

    def self.clerk
      if    $chosen_feature ==        "woven mats"; puts "You are in a hotel with woven mats."
      elsif $chosen_feature == "ornate chandelier"; puts "You are in a hotel with ornate chandeliers."
      end

      puts "#{hotel_clerk} I'm a hotel clerk, would you like to rent a room? << "

      answer = gets.chomp

      if answer == "rent room"
        puts "#{hotel_clerk} Do you have 5 yen? << "

        answer = gets.chomp

        if answer == "Yes" or "yes"
          BequestMerchant::Inn.rent_room
        else
          BequestMerchant::Inn.decline_room
        end
      else
        puts "#{hotel_clerk} Maybe some other time."
      end
    end

    def self.decline_room
      puts "#{hotel_clerk} I'm sorry, we can't give you a room unless you have 5 Yen."

      @player_hp = @max_player_hp

      @yen = @yen - 5
    end

    def self.rent_room
      @hotel_stay = @hotel_stay    + 1
      @player_hp  = @max_player_hp

      puts "#{hotel_clerk} I hope you enjoyed the complementary breakfast."
    end
  end

  class Petshop
    def self.initialize
      @yen     = File.read("lib/player/currency/value_of_yen.txt").to_i
      @franc   = File.read("lib/player/currency/value_of_franc.txt").to_i
      @lunario = File.read("lib/player/currency/value_of_lunario.txt").to_i

      @shoe_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_shoe_hp = 50

      @player_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_player_hp = 125
    end

    def self.clerk
      if    $chosen_feature ==        "woven mats"; puts "You are in a pet store with woven mats."
      elsif $chosen_feature == "ornate chandelier"; puts "You are in a pet store with ornate chandeliers."
      end

    end

    ## Methods only the clerk is able to access.
    def self.purchase_spiderfeed
    end

    def self.request_hair_trimming
    end
  end

  class ShoeCarpenter

    def self.initialize
      @yen     = File.read("lib/player/currency/value_of_yen.txt").to_i
      @franc   = File.read("lib/player/currency/value_of_franc.txt").to_i
      @lunario = File.read("lib/player/currency/value_of_lunario.txt").to_i

      @shoe_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_shoe_hp = 50

      @player_hp     = File.read("lib/player/metrics/shoe_hp.txt")
      @max_player_hp = 125
    end

    def self.carpenter
      if    $chosen_feature ==        "woven mats"; puts "You are in a carpenter barn with woven mats."
      elsif $chosen_feature == "ornate chandelier"; puts "You are in a carpenter barn with ornate chandeliers."
      end

      puts "#{shoe_carpenter} I'm a shoe carpenter, would you like to be repair your shoes? << "

      answer = gets.chomp

      if "repair shoes" == answer
        puts "#{shoe_carpenter} Do you have 5 Franc's << "

        answer = gets.chomp

        if answer == "Yes" or "yes"
          BequestMerchant::ShoeCarptener.repair_shoes
        else
          puts "#{shoe_carpenter} Come back when you have 5 Francs."
        end
      else
        puts "#{shoe_carpenter} Maybe some other time."
      end
    end

    def self.repair_shoes
      puts "#{shoe_carpenter} I repaired your wooden shoes."

      @shoe_hp = @max_shoe_hp

      @franc = @franc - 5
    end

  end
end

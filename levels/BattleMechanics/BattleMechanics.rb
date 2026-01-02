  # If the previous enemy encountered matches one you've dueled before, it quips about not continuing to run into them.
  def self.familiarity
    previous_enemy = File.read("lib/previous/enemy.txt")

    name_list  = File.readlines("lib/rendered/enemies.txt")
    size_limit = name_list.size.to_i
    index      = 0

    size_limit.times do
      current_enemy = name_list[index]

      if current_enemy == previous_enemy
        puts "<< We have to stop running into each other."
      else
        puts "<< I don't believe we've met."
      end

      index = index + 1

      sleep(0.5)
    end
  end

  def self.lure_enemy
    #        true  false
    # true   t,t   t,f
    # false  f,t   f,f

    active_state = [
      [[true,  true], [true,  false]],
      [[false, true], [false, false]],
    ]

    row_options = [0, 1]
    col_options = [0, 1]
    arr_options = [0, 1]

    cur_row = row_options.sample
    cur_col = col_options.sample
    cur_arr = arr_options.sample

    lure_status = active_state[cur_row][cur_col][cur_arr]

    if    false == lure_status
      puts "did not manage to spot you."
    elsif true  == lure_status
      puts "managed to spot you."

      enemy_hit = ["hit", "miss"]

      current_strike = enemy_hit.sample

      if    current_strike == "hit"
        puts ">> You were struck by the aggressor."
        $player_hp = $player_hp - 2
      elsif current_strike == "miss"
        puts ">> You managed to avoid being struck."
      end
    end 
  end

  def self.stun_enemy
    #        true  false
    # true   t,t   t,f
    # false  f,t   f,f

    active_state = [
      [[true,  true], [true,  false]],
      [[false, true], [false, false]],
    ]

    row_options = [0, 1]
    col_options = [0, 1]
    arr_options = [0, 1]

    cur_row = row_options.sample
    cur_col = col_options.sample
    cur_arr = arr_options.sample

    stun_status = active_state[cur_row][cur_col][cur_arr]

    if    false == stun_status
      puts "was not paralyzed by your strike."
    elsif true  == stun_status
      puts "managed to be stunned by your strike."
    end 
  end

  def self.trap_enemy
    #        true  false
    # true   t,t   t,f
    # false  f,t   f,f

    active_state = [
      [[true,  true], [true,  false]],
      [[false, true], [false, false]],
    ]

    row_options = [0, 1]
    col_options = [0, 1]
    arr_options = [0, 1]

    cur_row = row_options.sample
    cur_col = col_options.sample
    cur_arr = arr_options.sample

    trap_status = active_state[cur_row][cur_col][cur_arr]

    if    false == trap_status
      puts "was not tricked into a trap."
    elsif true  == trap_status
      puts "managed to be trapped while you lured it in your direction."

      sleep(1.5)
    end 
    end

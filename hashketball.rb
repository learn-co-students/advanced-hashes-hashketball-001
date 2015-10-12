def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :num_points_scored => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :num_points_scored => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7

        },
        "Brook Lopez" => {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :num_points_scored => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :num_points_scored => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :num_points_scored => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }

            }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :num_points_scored => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2

        },
        "Bismak Biyombo" => {
          :player_name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :num_points_scored => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10

        },
        "DeSagna Diop" => {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :num_points_scored => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5

        },
        "Ben Gordon" => {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :num_points_scored => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0

        },
        "Brendan Haywood" => {
          :player_name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :num_points_scored => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12

        }


      }

    }
  }
end

def num_points_scored (player)
  points_scored = nil
  game_hash.each {|key, value| value[:players].each {|key ,value| if key == player
points_scored = value[:num_points_scored]
end }
}
points_scored
end



def shoe_size (player)
  shoe = nil
  game_hash.each {|key, value| value[:players].each {|key, value| if key == player
shoe = value[:shoe]
end }
}
shoe
end

def team_colors (team_name)
  colors = []
  game_hash.each {|key, value| if value[:team_name]==team_name
    colors=value[:colors] end}
    colors
end

def team_names
  team_names_arr = []
  game_hash.each {|key, value| team_names_arr << value[:team_name]}
  team_names_arr
end

def player_numbers (team)
 numbers = []
 game_hash.each {|key, value| if value[:team_name] == team
  value[:players].each {|key, value| numbers << value[:number]}
  end
}
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each {|key, value| value[:players].each{|key, value| if key == player_name
    value.shift
    value.each {|key, value| if key == :num_points_scored
      stats[:points] = value
    else
    stats[key] = value
  end
    }
  end }
    
}
stats
end

def big_shoe_rebounds
  max_shoe=nil
  shoe_rebounds=nil
  game_hash.each {|key, value| value[:players].each{|key, value| if max_shoe == nil 
    max_shoe = value[:shoe]
    shoe_rebounds = value[:rebounds]
  end
  if value[:shoe] > max_shoe
    max_shoe = value[:shoe]
    shoe_rebounds = value[:rebounds]
  end
    }
  }
shoe_rebounds
end 

def most_points_scored
  max_points = nil
  player_name = nil
  game_hash.each {|key,value| value [:players].each{|key, value| if max_points == nil
    player_name = value[:player_name]
    max_points = value[:num_points_scored]
  elsif value[:num_points_scored] > max_points
    player_name = value[:player_name]
    max_points = value[:num_points_scored]
  end
      }
    }
    player_name
end

def winning_team
  team_name = nil
  most_points = 0
  
  game_hash.each {|key, value| sum_points = 0
    value[:players].each {|key,value| sum_points += value[:num_points_scored]}
    if sum_points > most_points
      most_points = sum_points
      team_name = value [:team_name] end
  }
  team_name
end

def player_with_longest_name
  longest_name_length = 0
  player_name = nil
  game_hash.each{|key, value| value[:players].each_key{|key| if key.length > longest_name_length
    longest_name_length = key.length
    player_name = key end}}
    player_name
end

def long_name_steals_a_ton?
  max_steals = 0
  game_hash.each_value {|value| value[:players].each_value {|value| if value[:steals]>max_steals
  max_steals = value[:steals] end}}
  long_name_steals = 0
  game_hash.each_value {|value| value[:players].each {|key, value| if key == player_with_longest_name
    long_name_steals = value[:steals] end
    }}
    max_steals==long_name_steals ? true : false
end
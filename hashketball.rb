def game_hash()
  {:home =>
    {:team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players =>
      {"Alan Anderson" =>
          {:player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
      "Reggie Evans" =>
          {:player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
        "Brook Lopez" =>
          {:player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" =>
          {:player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" =>
          {:player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1}
        }
      },
  :away =>
    {:team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>
        {"Jeff Adrien" =>
          {:player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
        "Bismak Biyombo" =>
          {:player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
          },
        "DeSagna Diop" =>
          {:player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
        "Ben Gordon" =>
          {:player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
        "Brendan Haywood" =>
          {:player_name => "Brendan Haywood",
            :number => 33,
            :shoe => 15,
            :points => 6,
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

require 'pry'

def num_points_scored(nameinput)
  points_scored = 0
  game_hash.each do |location, team_data|
      team_data.each do |label, info|
        if label == :players
          info.each do |name, stats|
            if name == nameinput
              points_scored = game_hash[location][:players][nameinput][:points]
            end
          end
        end
      end
  end
  return points_scored

end


def shoe_size(nameinput)
  size = 0
  game_hash.each do |location, team_data|
      team_data.each do |label, info|
        if label == :players
          info.each do |name, stats|
            if name == nameinput
              size = game_hash[location][:players][nameinput][:shoe]
            end
          end
        end
      end
  end
  return size
end

def team_colors(teamname)
  colours = []
  game_hash.each do |location, team_data|
    team_data.each do |label, info|
      if game_hash[location][label] == teamname
        colours = game_hash[location][:colors]
      end
    end
  end
  return colours
end

def team_names()
  teamarray = []
  game_hash.each do |location, team_data|
    teamarray << game_hash[location][:team_name]
  end
  return teamarray
end

def player_numbers(teaminput)
  jerseyarray =[]
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == teaminput
    team_data.each do |label, info|
      if label == :players
        info.each do |name, statheader|
              jerseyarray << game_hash[location][:players][name][:number]
        end
      end
    end
    end
  end
  return jerseyarray
end

def player_stats(nameinput)
  statarray ={}
  game_hash.each do |location, team_data|
    team_data.each do |label, info|
      if label == :players
        info.each do |name, stat|
          if name == nameinput
            statarray = game_hash[location][:players][name]
          end
        end
      end
    end
  end

  statarray.delete_if {|key, value| key == :player_name}
end

def big_shoe_rebounds()
  lsize = 0
  reboundcounter = 0
  game_hash.each do |location, team_data|
    team_data.each do |label, info|
      if label == :players
        info.each do |name, stat|
          if game_hash[location][:players][name][:shoe] > lsize
            reboundcounter = game_hash[location][:players][name][:rebounds]
          end
        end
      end
    end
  end
  return reboundcounter
end


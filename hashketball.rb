require 'pry'

def game_hash

{ # Start of hash
 :home => { # start of :home
  :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players => [{
    :player_name => "Alan Anderson",
    :number => 0,
    :shoe => 16,
    :points => 22,
    :rebounds => 12,
    :assists => 12,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 1
  },
  {
    :player_name => "Reggie Evans",
    :number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7
  },
  {
    :player_name => "Brook Lopez",
    :number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15
  },
  {
    :player_name => "Mason Plumlee",
    :number => 1,
    :shoe => 19,
    :points => 26,
    :rebounds => 12,
    :assists => 6,
    :steals => 3,
    :blocks => 8,
    :slam_dunks => 5
  },
  {
    :player_name => "Jason Terry",
    :number => 31,
    :shoe => 15,
    :points => 19,
    :rebounds => 2,
    :assists => 2,
    :steals => 4,
    :blocks => 11,
    :slam_dunks => 1
  }]
 }, # end of :home
 :away => {
  :team_name => "Charlotte Hornets",
  :colors => ["Turquoise", "Purple"],
  :players => [{
    :player_name => "Jeff Adrien",
    :number => 4,
    :shoe => 18,
    :points => 10,
    :rebounds => 1,
    :assists => 1,
    :steals => 2,
    :blocks => 7,
    :slam_dunks => 2
  },
  {
    :player_name => "Bismak Biyombo",
    :number => 0,
    :shoe => 16,
    :points => 12,
    :rebounds => 4,
    :assists => 7,
    :steals => 7,
    :blocks => 15,
    :slam_dunks => 10
  },
  {
    :player_name => "DeSagna Diop",
    :number => 2,
    :shoe => 14,
    :points => 24,
    :rebounds => 12,
    :assists => 12,
    :steals => 4,
    :blocks => 5,
    :slam_dunks => 5
  },
  {
    :player_name => "Ben Gordon",
    :number => 8,
    :shoe => 15,
    :points => 33,
    :rebounds => 3,
    :assists => 2,
    :steals => 1,
    :blocks => 1,
    :slam_dunks => 0
  },
  {
    :player_name => "Brendan Haywood",
    :number => 33,
    :shoe => 15,
    :points => 6,
    :rebounds => 12,
    :assists => 12,
    :steals => 22,
    :blocks => 5,
    :slam_dunks => 12
  }]
 }

} # End of Hash

end

# Method will provide points of player by passing it the player's name, it searches throught
# nested hash for that player, and returns the :points
def num_points_scored(player_searched)
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        # Attribute points to k4ys, data points to values, including players
        # puts attribute
        # puts data
        # binding.pry
        if data.is_a?(Array) && attribute == :players
          # p data
          # if data.include?(player_searched)
            data.each do |person|
              if person[:player_name] == player_searched
                return person[:points]
              # Search for player's name here
              # Iterate though :player_name to match player_searched
              # puts "#{person[:player_name]}: #{person[:points]}"
              # binding.pry
             end
          end
        end
    end
  end
end

def shoe_size(player_shoe_size)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if data.is_a?(Array) && attribute == :players
            data.each do |person|
              if person[:player_name] == player_shoe_size
                return person[:shoe]
             end
          end
        end
    end
  end
end

def team_colors(team_name_search)
  game_hash.each do |location, team_data|
    if team_name_search == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, team_values|
      if team_keys == :team_name
        team_name_array = []
        team_name_array << :team_name
      end
        # if team_values.is_a?(String)
        #   team_name_array << team_values
        # binding.pry
        # end
    end
    # return team_name_array
  end
end

# http://stackoverflow.com/questions/21402111/typeerror-no-implicit-conversion-of-symbol-into-integer
# Build a method, team_names, that operates on the game hash to return an array
# of the team names.
def team_names
  game_hash.collect do |team_location, team_data|
      team_data[:team_name]
  end
end

# Build a method, player_numbers, that takes in an argument of a team name and
# returns an array of the jersey number's for that team.
def player_numbers(team_searched)
  numbers = []
  game_hash.collect do |team_location, team_data|
    # if team_data == "Brooklyn Nets"
    if team_data[:team_name] == team_searched
      team_data.each do |team_keys, team_values|
        # binding.pry
        if team_keys == :players
          team_values.each do |player_data|
            player_data.collect do |key, value|
              if key == :number
                numbers << value
              end
            end
          end
        end
      end
    end
  end
  numbers
end

# player_numbers("Brooklyn Nets")

def player_stats(players_name)
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |player_hash|
          if player_hash[:player_name] == players_name
            stats = player_hash
            stats.delete(:player_name)
            return stats
          end
        end
      end
    end
  end
end


# {
#  :home => {
#   :team_name => "Brooklyn Nets",
#   :colors => ["Black", "White"],
#   :players => [{
#     :player_name => "Alan Anderson",
#     :number => 0,
#     :shoe => 16,
#     :points => 22,
#     :rebounds => 12,
#     :assists => 12,
#     :steals => 3,
#     :blocks => 1,
#     :slam_dunks => 1
#   },

def big_shoe_rebounds
  size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |players|
      if players[:shoe] > size
       size = players[:shoe]
       rebounds = players[:rebounds] 
      end
    end
  end 
  rebounds
end



#
#
#




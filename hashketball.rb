require 'pry'
# Write your code here!
def game_hash
game_hash = {
  home:  {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players:[
      "Alan Anderson" => {
        player_name: "Alan Anderson" ,
        number: 0 ,
        shoe: 16 ,
        points: 22 ,
        rebounds: 12 ,
        assists: 12 ,
        steals: 3 ,
        blocks: 1 ,
        slam_dunks: 1
        },
      "Reggie Evans"  => {
        player_name: "Reggie Evans" ,
        number: 30 ,
        shoe: 14 ,
        points: 12 ,
        rebounds: 12 ,
        assists: 12 ,
        steals: 12 ,
        blocks: 12 ,
        slam_dunks: 7
        },
      "Brook Lopez"  => {
        player_name: "Brook Lopez" ,
        number: 11 ,
        shoe: 17 ,
        points: 17 ,
        rebounds: 19 ,
        assists: 10 ,
        steals: 3 ,
        blocks: 1 ,
        slam_dunks: 15
        },
      "Mason Plumlee"  => {
        player_name: "Mason Plumlee" ,
        number: 1 ,
        shoe: 19 ,
        points: 26 ,
        rebounds: 12 ,
        assists: 6 ,
        steals: 3 ,
        blocks: 8 ,
        slam_dunks: 5
        },
      "Jason Terry"  => {
        player_name: "Jason Terry" ,
        number: 31 ,
        shoe: 15 ,
        points: 19 ,
        rebounds: 2 ,
        assists: 2 ,
        steals: 4 ,
        blocks: 11 ,
        slam_dunks: 1
        }
      ]
    },

    away:  {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
    players:[
      "Jeff Adrien" => {
        player_name: "Jeff Adrien" ,
        number: 4 ,
        shoe: 18 ,
        points: 10 ,
        rebounds: 1,
        assists: 1 ,
        steals: 2 ,
        blocks: 7 ,
        slam_dunks: 2
        },
      "Bismak Biyombo"  => {
        player_name: "Bismak Biyombo" ,
        number: 0 ,
        shoe: 16 ,
        points: 12 ,
        rebounds: 4 ,
        assists: 7 ,
        steals: 7 ,
        blocks: 15,
        slam_dunks: 10
        },
      "DeSagna Diop"  => {
        player_name: "DeSagna Diop" ,
        number: 2 ,
        shoe: 14 ,
        points: 24 ,
        rebounds: 12 ,
        assists: 12 ,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
        },
      "Ben Gordon"  => {
        player_name: "Ben Gordon" ,
        number: 8 ,
        shoe: 15 ,
        points: 33 ,
        rebounds: 3 ,
        assists: 2 ,
        steals: 1 ,
        blocks: 1 ,
        slam_dunks: 0
        },
      "Brendan Haywood"  => {
        player_name: "Brendan Haywood" ,
        number: 33 ,
        shoe: 15 ,
        points: 6,
        rebounds: 12 ,
        assists: 12 ,
        steals: 22 ,
        blocks: 5 ,
        slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player)
   points_scored = 0
   game_hash.each do |team, team_attributes|
  #   binding pry
     game_hash[team][:players].each do |player_array|
       player_array.each do |names, stat_hash|
         if names == player
           points_scored = stat_hash[:points]
         end
       end
     end
   end
  points_scored
 end


def shoe_size(player)
  player_shoe_size = 0
     game_hash.each do |location, team_data|
       game_hash[location][:players].each do |players_array|
         players_array.each do |name, stat_hash|
           if name == player
             player_shoe_size = stat_hash[:shoe]
          end
        end
      end
     end
  player_shoe_size
end

def team_colors(team)
  team_colors = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      team_colors = game_hash[location][:colors]
            end
          end
team_colors
end

def team_names
  teams = []
    game_hash.each do |location, team_data|
  #   binding.pry
      team_data.each do |attribute, data|
        if attribute == :team_name
          teams << data
        end
      end
    end
  teams
end

def player_numbers(team)
  player_numbers = []
     game_hash.each do |location, team_data|
       if game_hash[location][:team_name] == team
         game_hash[location][:players].each do |name_hash|
           name_hash.each do |names, stat_hash|
             player_numbers << name_hash[names][:number]
            end
          end
        end
      end
  player_numbers
end

def player_stats(player)
  stat_hash = {}
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_hashes|
            if player_hashes.has_key?(player)
   #           binding pry
              stat_hash = player_hashes[player]
              stat_hash.shift
            end
          end
        end
      end
  end
  stat_hash
end

def big_shoe_rebounds
  largest_shoe_size = 0
  rebounds = 0
  game_hash.each do |team, team_attributes|
          game_hash[team][:players].each do |player_array|
            player_array.each do |names, stat_hash|
              if stat_hash[:shoe] > largest_shoe_size
                largest_shoe_size = stat_hash[:shoe]
                rebounds = stat_hash[:rebounds]
              end
            end
          end
        end
  rebounds
end

def most_points_scored
  most_points = 0
  high_scorer = ""
  game_hash.each do |team, team_attributes|
    game_hash[team][:players].each do |name_hash|
#   team[:players].each do |name_hash|
      name_hash.each do |names, stat_hash|
        if stat_hash[:points] > most_points
          most_points = stat_hash[:points]
          high_scorer = names
        end
      end
    end
  end
  high_scorer
end

def winning_team
  most_points = 0
  win_team = ""
  game_hash.each do |team, team_attributes|
    team_points = 0
    game_hash[team][:players].each do |name_hash|
      name_hash.each do |names, stat_hash|
 #   team[:players].each do |name_hash|
      team_points = team_points + stat_hash[:points]
      end
      if team_points > most_points
        most_points = team_points
        win_team = game_hash[team][:team_name]
      end
    end
  end
  win_team
end

def player_with_longest_name
  max_length = 0
  longest_name = ""
  game_hash.each do |team, team_attributes|
    game_hash[team][:players].each do |name_hash|
  #  team[:players].each do |name_hash|
      name_hash.each do |names, stat_hash|
        if names.length > max_length
          max_length = names.length
          longest_name = names
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  max_steals = 0
  max_steals_name = ""
  true_or_false = false
  game_hash.each do |team, team_attributes|
    game_hash[team][:players].each do |name_hash|
      name_hash.each do |names, stat_hash|
        if stat_hash[:steals] > max_steals
          max_steals = stat_hash[:steals]
          max_steals_name = names
        end
      end
    end
  end
  true_or_false = player_with_longest_name == max_steals_name
end












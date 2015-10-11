require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["black", "white"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["turquoise", "purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
    }
  }
end


def get_stat_by_player(player, stat)
  value = nil
  
  game_hash.each do |team, team_vals|
    if team_vals[:players].keys.include?(player)
      value = team_vals[:players][player][stat]
      break
    end
  end
  
  value
end
  
  
def num_points_scored(player)
  get_stat_by_player(player, :points)
end


def shoe_size(player)
  get_stat_by_player(player, :shoe)
end


def get_data_by_team(team, data)
  value = nil
  
  game_hash.each do |key, team_vals|
    if team_vals[:team_name] == team
      value = team_vals[data]
      break
    end
  end
  
  value
end


def team_colors(team)
  get_data_by_team(team, :colors).collect do |color|
    color.capitalize
  end
end


def team_names
  game_hash.collect do |key, values|
    values[:team_name]
  end
end


def get_stat_list_by_team(team, stat)
  get_data_by_team(team, :players).collect do |player, player_vals|
    player_vals[stat]
  end
end


def player_numbers(team)
  get_stat_list_by_team(team, :number)
end


def player_stats(player)
  value = nil
  
  game_hash.each do |team, team_vals|
    if team_vals[:players].keys.include?(player)
      value = team_vals[:players][player]
      break
    end
  end
  
  value
end


def big_shoe_rebounds
  big_shoe = 0
  num_rebounds = 0
  
  game_hash.each do |team, team_vals|
    team_vals[:players].each do |player, stats|
      if stats[:shoe] > big_shoe
        big_shoe = stats[:shoe]
        num_rebounds = stats[:rebounds]
      end
    end
  end
    
  num_rebounds
end


def most_points_scored
  high_score = 0
  leader = nil
  
  game_hash.each do |team, team_vals|
    team_vals[:players].each do |player, stats|
      if stats[:points] > high_score
        high_score = stats[:points]
        leader = player
      end
    end
  end
  
  leader
end


def winning_team
  high_score = 0
  winner = nil
  
  game_hash.each do |team, team_vals|
    team_score = get_stat_list_by_team(team_vals[:team_name], :points).inject do |sum, x|
      sum + x
    end
    
    if team_score > high_score
      high_score = team_score
      winner = team_vals[:team_name]
    end
  end
  
  winner
end


def player_with_longest_name
  long_name = nil
  name_length = 0
  
  game_hash.each do |team, team_vals|
    team_vals[:players].each do |player, stats|
      cur_length = player.length
      if cur_length > name_length
        name_length = cur_length
        long_name = player
      end
    end
  end
  
  long_name
end


def long_name_steals_a_ton?
  long_name = nil
  name_length = 0
  steal_leader = nil
  most_steals = 0
  
  game_hash.each do |team, team_vals|
    team_vals[:players].each do |player, stats|
      cur_length = player.length
      cur_steals = stats[:steals]
      
      if cur_length > name_length
        name_length = cur_length
        long_name = player
      end
      
      if cur_steals > most_steals
        most_steals = cur_steals
        steal_leader = player
      end
    end
  end
  
  long_name == steal_leader
end
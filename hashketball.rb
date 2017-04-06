require 'pry'

def game_hash

game_hash = {
  :home=>{
    :team_name=>"Brooklyn Nets", 
    :colors=>["Black","White"],
    :players=>{
      "Alan Anderson"=>{
        :number=>0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1},
      "Reggie Evans"=>{
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7},
      "Brook Lopez"=>{
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15},
      "Mason Plumlee"=>{
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>12,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5},
      "Jason Terry"=>{
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1}
        }},
  :away=>{
    :team_name=>"Charlotte Hornets",
    :colors=>["Turquoise","Purple"],
    :players=>{
      "Jeff Adrien"=>{
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2},
      "Bismak Biyombo"=>{
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>7,
        :blocks=>15,
        :slam_dunks=>10},
      "DeSagna Diop"=>{
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5},
      "Ben Gordon"=>{
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0},
      "Brendan Haywood"=>{
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>22,
        :blocks=>5,
        :slam_dunks=>12}
        }}}

#game_hash

end# Write your code here!

def num_points_scored(name)

  game_hash.each do |location,team_data|

   
    team_data.each do |attribute,data|

      if data.is_a?(Hash)
        data.each do |member,member_data|
          if member == name
            return member_data[:points]

          end 
          end
        
      end
    end
  end
end

def shoe_size(name)

  game_hash.each do |location,team_data|

   
    team_data.each do |attribute,data|

      if data.is_a?(Hash)
        data.each do |member,member_data|
          if member == name
            return member_data[:shoe]

          end 
          end
        
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data|
      if data == team_name
        return team_data[:colors]
        break
      end
    end
  end

end

def team_names

  names = []

  game_hash.each do |location, team_data|
      names << team_data[:team_name]
  end
  return names
end

def player_numbers(team)
numbers = []
  game_hash.each do |location,team_data|
    team_data.each do | attribute,data|
      if data == team
        team_data[:players].each do |player,stats|
          numbers << stats[:number]
       end
     end
   end
  end
return numbers
end

def player_stats(name)


  game_hash.each do |location,team_data|
    team_data.each do | attribute,data|
      if data.is_a?(Hash)
        data.each do |player,stats|
          if player == name
            return stats
            break
          end
        end
      end
   end
  end
end

def big_shoe_rebounds

shoe = 0
rebounds = 0
  game_hash.each do |location,team_data|
    team_data.each do | attribute,data|
      if data.is_a?(Hash)
        data.each do |player,stats|
          if stats[:shoe] > shoe
            shoe = stats[:shoe]
            rebounds = stats[:rebounds]
          end

        end
      end
   end
  end
  return rebounds
end

def most_points_scored

points = 0
high_player = ""
  game_hash.each do |location,team_data|
    team_data.each do | attribute,data|
      if data.is_a?(Hash)
        data.each do |player,stats|
          if stats[:points] > points
            points = stats[:points]
            high_player = player
          end

        end
      end
   end
  end
  return high_player
end


def winning_team
  score = 0
  game_results = {}
  game_hash.each do |location,team_data|
    team_data.each do | attribute,data|
      if data.is_a?(Hash)
        data.each do |player,stats|
          if game_results.has_key?(team_data[:team_name])
            score =  score + stats[:points]
            game_results[team_data[:team_name]] = score
          else
            score = stats[:points]
            game_results[team_data[:team_name]] = score
          end
          #binding.pry
        end
      end
    end
  end
  game_results.key(game_results.values.max)
end

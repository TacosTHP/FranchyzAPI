class Team < ApplicationRecord
  belongs_to  :creator, class_name: 'Coach'
  belongs_to  :coach
  belongs_to  :club
  has_many    :players

  def self.get_game_teams(game)
    teams = Team.joins(players: :games).where(games: {id: game.id})
    return teams
  end
end

class Game < ApplicationRecord
    has_many :attendances
    has_many :players, through: :attendances

  def retrieve_teams
    Team.joins(players: :games).where(games: { id: self.id })
  end
end

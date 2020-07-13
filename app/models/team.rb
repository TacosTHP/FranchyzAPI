class Team < ApplicationRecord
  belongs_to  :creator, class_name: 'Coach'
  belongs_to  :coach
  belongs_to  :club
  has_many    :players

  def retrieve_attendances
    games = Game.joins(players: :team).where('team_id = ?', self.id)
    practices = Practice.joins(players: :team).where('team_id = ?', self.id)
    {
      games: games,
      practices: practices
    }
  end
end

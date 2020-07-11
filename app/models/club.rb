class Club < ApplicationRecord
  belongs_to :creator, class_name: 'Coach'
  has_many :coaches
  has_many :teams

  def retrieve_players
    Player.joins(:team).where('club_id = ?', self.id)
  end

  def retrieve_games
    Game.joins(players: :team).where('club_id = ?', self.id)
  end

  def retrieve_practices
    Practice.joins(players: :team).where('club_id = ?', self.id)
  end
end

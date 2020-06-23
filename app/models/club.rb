class Club < ApplicationRecord
  has_many :coaches
  has_many :teams
  belongs_to :creator, class_name: 'Coach'

  def self.get_players(club)
    Player.joins(:team).where('club_id = ?', club.id)
  end

  def self.get_games(club)
    Game.joins(players: :team).where('club_id = ?', club.id)
  end

  def self.get_practices(club)
    Practice.joins(players: :team).where('club_id = ?', club.id)
  end


end

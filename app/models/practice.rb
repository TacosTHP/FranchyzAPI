class Practice < ApplicationRecord
  has_many :attendances
  has_many :players, through: :attendances

  def self.get_team_practices(team)
    players_ids = []
    team.players.each do |player|
      players_ids << player.id
    end
    practices = Practice.joins(:players).where(players: {id: players_ids}).distinct
    return practices
  end

  def self.get_my_attended_practices(id)
    Practice.joins(:attendances).where(attendances: { confirmed?: true }).where('player_id = ?', id)
  end

  def self.get_my_unattended_practices(id)
    Practice.joins(:attendances).where(attendances: { confirmed?: false }).where('player_id = ?', id)
  end
end

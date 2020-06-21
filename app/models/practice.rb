class Practice < ApplicationRecord
	has_many :events
	has_many :players, through: :events

	def self.get_team_practices(team)
    players_ids = []
    team.players.each do |player|
      players_ids << player.id
    end
    practices = Practice.joins(:players).where(players: {id: players_ids}).distinct
    return practices
  end

	def self.get_my_attended_practices(id)
    Practice.joins(:events).where('player_id = ?', id)
  end
end

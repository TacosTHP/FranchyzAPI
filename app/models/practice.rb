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
    Practice.joins(:events).where(events: { confirmed?: true }).where('player_id = ?', id)
  end

	def self.get_my_unattended_practices(id)
		Practice.joins(:events).where(events: { confirmed?: false }).where('player_id = ?', id)
	end
end

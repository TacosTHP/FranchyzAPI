class Game < ApplicationRecord
    has_many :events
    has_many :players, through: :events

  def self.get_team_games(team)
    players_ids = []
    team.players.each do |player|
      players_ids << player.id
    end
    games = Game.joins(:players).where(players: {id: players_ids}).distinct
    return games
  end

  def self.get_my_attended_games(id)
    Game.joins(:events).where(events: { confirmed?: true }).where('player_id = ?', id)
  end

  def self.get_my_unattended_games(id)
    Game.joins(:events).where(events: { confirmed?: false }).where('player_id = ?', id)
  end
end

class Game < ApplicationRecord
    has_many :events
    has_many :players, through: :events


  def self.get_my_games(id, type)
    if (type == 'coach')
      return Game.where('coach_id' => id)
    elsif (type == 'player')
      return Game.where('player_id' => id)
    else
      return 'error'
    end
  end

  def self.get_team_games(team)
    players_ids = []
    team.players.each do |player|
      players_ids << player.id
    end
    games = Game.joins(:players).where(players: {id: players_ids}).distinct
    return games
  end

  def self.get_team_practices(team)
    players_ids = []
    team.players.each do |player|
      players_ids << player.id
    end
    practices = Practice.joins(:players).where(players: {id: players_ids}).distinct
    return practices
  end
end

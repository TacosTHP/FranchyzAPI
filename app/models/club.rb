class Club < ApplicationRecord
  has_many :coaches
  has_many :teams
  belongs_to :creator, class_name: 'Coach'

  def self.get_players(club)
    teams_ids = []
    club.teams.each do |team|
      teams_ids << team.id
    end
    players = Player.joins(:team).where(teams: {id: teams_ids}).distinct
    return players
  end

  def self.get_games(club)
    games_club = []
    club.teams.each do |team|
      games_tmp = Game.get_team_games(team)
      games_tmp.each do |game|
        games_club << game
      end
    end
    return games_club
  end

  def self.get_practices(club)
    practices_club = []
    club.teams.each do |team|
      practices_tmp = Game.get_team_practices(team)
      practices_tmp.each do |practice|
        practices_club << practice
      end
    end
    return practices_club
  end
end

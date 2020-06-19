class Event < ApplicationRecord
  belongs_to :player
  belongs_to :game, optional: true
  belongs_to :practice, optional: true

  # def self.get_my_attended_games(id)
  #   Event.where('player_id = ?', id).where.not(game_id: nil)
  # end
end

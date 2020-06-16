class Game < ApplicationRecord
    # has_many :events
    # has_many :players, through: :events


  def self.get_my_games(id, type)
    if (type == 'coach')
      return Game.where('coach_id' => id)
    elsif (type == 'player')
      return Game.where('player_id' => id)
    else
      return 'error'
    end

  end
end

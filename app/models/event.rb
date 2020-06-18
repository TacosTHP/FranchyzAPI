class Event < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :practice

  def self.get_my_events(id)
    
  end
end

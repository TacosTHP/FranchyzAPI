class Event < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :game, optional: true
  belongs_to :practice, optional: true

  def self.get_my_events(id)
    
  end
end

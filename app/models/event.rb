class Event < ApplicationRecord
  belongs_to :player
  belongs_to :game
  # belongs_to :practice
end

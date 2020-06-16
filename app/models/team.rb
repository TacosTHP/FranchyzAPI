class Team < ApplicationRecord
  belongs_to :coach
  belongs_to :club
  has_many :players
end

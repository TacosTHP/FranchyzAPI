class Club < ApplicationRecord
  has_many :coaches
  has_many :teams
end

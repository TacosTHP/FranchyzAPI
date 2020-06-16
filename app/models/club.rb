class Club < ApplicationRecord
  has_many :coaches
  has_many :teams
  belongs_to :creator, class_name: 'Coach'
end

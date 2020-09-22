class Club < ApplicationRecord
  belongs_to :creator, class_name: 'Coach'
  has_many :coaches
  has_many :teams
end

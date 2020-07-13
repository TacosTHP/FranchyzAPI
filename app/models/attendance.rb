class Attendance < ApplicationRecord
  belongs_to :player
  belongs_to :game, optional: true
  belongs_to :practice, optional: true
end

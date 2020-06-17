class Practice < ApplicationRecord
	has_many :events
	has_many :players, through: :events
end

class Practice < ApplicationRecord
	has_many :players, through: :events
end

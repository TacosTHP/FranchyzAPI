class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  belongs_to :team
  has_many :emergency_contacts
  has_many :attendances
  has_many :games, through: :attendances
  has_many :practices, through: :attendances

  def jwt_payload
    { 
      'email' => self.email,
      'first_name' => self.first_name,
      'last_name' => self.last_name, 
      'team_id' => self.team_id,
      'club_id' => self.team.club.id
    }
  end

end

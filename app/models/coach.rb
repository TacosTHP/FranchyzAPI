class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist


  has_many :teams

  belongs_to :club, optional: true


  def jwt_payload
    { 
      'email' => self.email,
      'first_name' => self.first_name,
      'last_name' => self.last_name, 
      'admin?' => self.admin?, 
      'club_id' => self.club_id,
    }
  end

end

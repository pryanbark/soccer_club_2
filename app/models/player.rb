class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  POSITIONS = ["attack", "middle", "defense"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :owner, optional: true
  validates :position, inclusion: { in: POSITIONS }
  validates :full_name, length: { in: 6..20 }
  validates :email, uniqueness: true

  scope :available_players_by_position, -> (position) { where(position: position, owner_id: nil) }

  def self.available_players
    Player.where(owner_id: nil)
  end
end

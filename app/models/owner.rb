class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Is an active record association of Player
  has_many :players
  # All validations are below for Owner
  validates :club_name, presence: true, uniqueness: true
  validates :email, uniqueness: true
end

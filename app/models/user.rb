class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :barrio_id, :lastname, :name, :banned
  belongs_to :barrio
  has_many :events
  has_many :alerts
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
end

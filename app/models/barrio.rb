class Barrio < ActiveRecord::Base
  attr_accessible :barrio
  has_many :users
  has_many :events
  has_many :alerts
  
  
end

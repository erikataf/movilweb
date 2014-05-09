class Event < ActiveRecord::Base
  attr_accessible :Date, :Description, :Name, :Place, :Time, :barrio_id, :user_id
  belongs_to :user 
  belongs_to :barrio
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :alert
  belongs_to :event
  belongs_to :user
  belongs_to :barrio
  attr_accessible :barrio_id, :comment, :user_id
end

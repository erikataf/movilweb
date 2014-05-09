class Alert < ActiveRecord::Base
attr_accessible :Date, :Time, :barrio_id, :comment_id, :description, :name, :place, :user_id
belongs_to :user 
belongs_to :barrio
has_many :comments
end

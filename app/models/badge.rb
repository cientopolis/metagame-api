class Badge < ActiveRecord::Base

  #Relationships
  has_many :levels
  belongs_to :type, :class_name => "ActivityType", :foreign_key => :activity_type_id
  belongs_to :project

end

class Badge < ActiveRecord::Base

  scope :by_type, -> (activity_type) { where activity_type_id: activity_type.id }
  scope :with_points, -> {where "points > 0"}
  scope :less_or_equal_points_than, ->(points){ with_points.where("points <= ?", points) }
  scope :more_or_equal_points_than, ->(points){ with_points.where("points >= ?", points) }

  #Relationships
  has_many :levels
  belongs_to :type, :class_name => "ActivityType", :foreign_key => :activity_type_id
  belongs_to :project

end

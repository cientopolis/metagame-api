class ActivityType < ActiveRecord::Base

  scope :by_name, ->(value){where name:value}


end

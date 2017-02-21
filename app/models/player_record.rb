class PlayerRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :project
  belongs_to :type, :class_name => "ActivityType", :foreign_key => :activity_type_id

  def new_from_activity(activity)
    #Returns a new Player record
    self.project = activity.project
    self.type = activity.type
    self.player = activity.player
    self.save!
    return self
  end

  def update_values(new_value)
    self.last_value = self.value
    self.value = self.value + new_value
    self.save!
    return self
  end


end

class PlayerRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :project
  belongs_to :type, :class_name => "ActivityType", :foreign_key => :activity_type_id

  def create_player_record(activity,player)
    #Returns a new Player record
    self.project = activity.project
    self.type = activity.type
    self.player = player
    self.save!
  end


end

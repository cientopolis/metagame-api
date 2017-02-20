class Player < ActiveRecord::Base

  #Relationships
  has_many   :levels
  has_many   :badges, :through => :levels
  belongs_to :rank, :class_name => "PlayerRank"
  has_many   :player_records, :class_name => "PlayerRecord"

  #Validations
  validates :email, :presence => true

  def add_badge(badge)
    self.badges << badge
  end

  def remove_badge(badge)
    self.badges.delete(badge)
  end

  def record_activity(activity)

    if activity.project && activity.type
     #Find
     player_record = self.player_records
     .detect{|pr| pr.project == activity.project && pr.type == activity.type }
     #Create
     if player_record.nil?
        PlayerRecord.new.create_player_record(activity,player)
        self.player_records << player_record
     end
     #Update counts
     player_record.value = player_record.value + activity.count
     player_record.save!
     player_record
    end

  end

end

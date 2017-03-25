class PlayerRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :project

  has_one :login_record, class_name: "LoginRecord"
  has_one :contribution_record, class_name: "ContributionRecord"
  has_one :dissemination_record, class_name: "DisseminationRecord"
  has_one :reinforcement_record, class_name: "ReinforcementRecord"

  def initialize
    self.login_record = LoginRecord.new
    self.contribution_record = ContributionRecord.new
    self.dissemination_record = DisseminationRecord.new
    self.reinforcement_record = ReinforcementRecord.new
  end


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

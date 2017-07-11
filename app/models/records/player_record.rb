class PlayerRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :project

  has_one :login_record, class_name: "LoginRecord", dependent: :destroy
  has_one :contribution_record, class_name: "ContributionRecord", dependent: :destroy
  has_one :reinforcement_record, class_name: "ReinforcementRecord", dependent: :destroy
  has_one :dissemination_record, class_name: "DisseminationRecord", dependent: :destroy

  #Initialize Records
  after_create :initialize_records

  def initialize_records
    self.create_login_record
    self.create_contribution_record
    self.create_reinforcement_record
    self.create_dissemination_record
  end

  def record_on(activity)
    #Notifies all records
    activity.record_on(self.login_record)
    activity.record_on(self.contribution_record)
    activity.record_on(self.dissemination_record)
    activity.record_on(self.reinforcement_record)
  end

end

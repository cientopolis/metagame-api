class ActivityRecord < ActiveRecord::Base

  scope :login_records, -> { where(type: 'LoginRecord') }
  scope :contribution_records, -> { where(type: 'ContributionRecord') }
  scope :reinforcement_records, -> { where(type: 'ReinforcementRecord') }
  scope :dissemination_records, -> { where(type: 'DisseminationRecord') }

  belongs_to :player_record

  self.inheritance_column = :type

  def record_login(activity)
    #Do nothing
  end

  def record_contribution(activity)
    #Do nothing
  end

  def record_reinforcement(activity)
    #Do nothing
  end

  def record_dissemination(activity)
    #Do nothing
  end

end

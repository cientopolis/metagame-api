class ActivityRecord < ActiveRecord::Base

  scope :login_records, -> { where(type: 'LoginRecord') }
  scope :contribution_records, -> { where(type: 'ContributionRecord') }
  scope :reinforcement_records, -> { where(type: 'ReinforcementRecord') }
  scope :dissemination_records, -> { where(type: 'DisseminationRecord') }

  belongs_to :player_record

  self.inheritance_column = :type

end

class PlayerRank < ActiveRecord::Base

  scope :visitor, -> { find_by(type: 'Visitor') }
  scope :explorer, -> { find_by(type: 'Explorer') }
  scope :commited_citizen_scientist, -> { find_by(type: 'CommitedCitizenScientist') }

  self.inheritance_column = :type

  def reevaluate_rank(player)

  end

end

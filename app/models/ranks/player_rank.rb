class PlayerRank < ActiveRecord::Base

  scope :visitor, -> { find_by(type: 'Visitor') }
  scope :explorer, -> { find_by(type: 'Explorer') }
  scope :citizen_scientist, -> { find_by(type: 'CitizenScientist') }
  scope :prolific_citizen_scientist, -> { find_by(type: 'ProlificCitizenScientist') }
  scope :commited_citizen_scientist, -> { find_by(type: 'CommitedCitizenScientist') }
  scope :visionary_citizen_scientist, -> { find_by(type: 'VisionaryCitizenScientist') }

  self.inheritance_column = :type

  def reevaluate_rank(player)
    #Should be implemented for all subclasses
  end


end

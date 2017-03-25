class Activity

  attr_accessor :player,:project,:type,:count

  TYPES = {
    login: LoginActivity.new(),
    contribution: ContributionActivity.new(),
    reinforcement: ReinforcementActivity.new(),
    dissemination: DisseminationActivity.new()
  }

  def initialize(player=nil,type=nil,project=nil,count=1)
    @player = player
    @project = project
    @type = type
    @count = count
  end

  def self.get_activity_type(player,type,project)
    new_act = TYPES[type.to_sym]
    if new_act
      new_act.player = player
      new_act.project = project
      new_act.type = type
    end
    new_act
  end

end

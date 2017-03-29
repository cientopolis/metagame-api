class Activity

  attr_accessor :player,:project,:type,:count,:modified_record

  TYPES = {
    login: LoginActivity,
    contribution: ContributionActivity,
    reinforcement: ReinforcementActivity,
    dissemination: DisseminationActivity
  }

  def initialize(args={})
    @player = args[:player]
    @project = args[:project]
    @type = args[:type]
    @count = args[:count] || 1
    @modified_record = nil
  end

  def self.get_activity_type(player,type,project,count)
    new_act = TYPES[type.to_sym]
    if new_act
      new_act = new_act.new(player:player,type:type,project:project,count:count)
    end
  end

end

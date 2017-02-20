class Activity

  attr_accessor :player,:project,:type,:count

  def initialize(player,project,type,count)
    @player = player
    @project = project
    @type = type
    @count = count
  end

end

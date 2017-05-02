class BadgeJudge
  #This is the Observer Class

  def initialize(player)
    @player = player
    @player.add_observer(self)
  end

  def update(activity,player_record)
    #Check the deserved badges
    if activity && player_record
      badges = deserved_badges(activity,player_record)
      issue_deserved_badges(activity.player,badges)
    end

  end

  private

  def issue_deserved_badges(player,badges)

    unless player.has_badges?(badges)
      new_badges = (badges - player.badges)
      Player.transaction do
          new_badges.each{ |b| player.add_badge(b) }
        end
    end

  end

  def deserved_badges(activity,player_record)
    modified_record = activity.get_record(player_record)
    badges = activity.project.badges.by_type(activity.type)
      .less_or_equal_points_than(modified_record.value)
  end


end

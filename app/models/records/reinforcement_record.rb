class ReinforcementRecord < ActivityRecord

  def record_reinforcement(activity)
    update_values(activity.count)
  end

end

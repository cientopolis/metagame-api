class ContributionRecord < ActivityRecord

  def record_contribution(activity)
    update_values(activity.count)
  end

end

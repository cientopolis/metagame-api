class DisseminationRecord < ActivityRecord

  def record_dissemination(activity)
    update_values(activity.count)
  end

end

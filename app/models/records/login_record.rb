class LoginRecord < ActivityRecord

  def record_login(activity)
    activity.modified_record = self
    update_values(activity.count)
  end

end

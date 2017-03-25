class LoginRecord < ActivityRecord

  def record_login(activity)
    update_values(activity.count)
  end

end

class LoginRecord < ActivityRecord

  def record_login(activity)
    self.last_value = self.value
    self.value = self.value + activity.count
    self.save
  end

end

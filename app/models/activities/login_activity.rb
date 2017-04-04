class LoginActivity < Activity

  def record_on(record)
    #We send to the LoginRecord the data from the activity
    record.record_login(self)
  end

  def get_record(record)
    record.login_record
  end


end

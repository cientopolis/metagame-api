class DisseminationActivity < Activity

  def record_on(record)
    #We send to the DisseminationRecord the data from the activity
    record.record_dissemination(self)
  end

end

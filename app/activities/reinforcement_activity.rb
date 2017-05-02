class ReinforcementActivity < Activity

  def record_on(record)
    #We send to the ReinforcementRecord the data from the activity
    record.record_reinforcement(self)
  end

  def get_record(record)
    record.reinforcement_record
  end
end

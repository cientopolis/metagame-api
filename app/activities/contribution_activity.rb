class ContributionActivity < Activity

  def record_on(record)
    #We send to the ContributionRecord the data from the activity
    record.record_contribution(self)
  end

  def get_record(record)
    record.contribution_record
  end

end

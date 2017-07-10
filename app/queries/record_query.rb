class RecordQuery < Query

  base_query PlayerRecord.all

  def add_email_filter(value)
    query.joins(:player).where(players:{email:value})
  end

  def add_project_filter(value)
    query.joins(:project).where(projects:{name:value})
  end

end

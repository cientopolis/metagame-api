class PlayerQuery < Query
  base_query Player.all

  def add_email_filter(value)
    query.where(email:value)
  end

  def add_project_filter(value)
    query.joins(player_records: :project).where("projects.name = ?",value)
  end

end

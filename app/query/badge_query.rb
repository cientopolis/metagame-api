class BadgeQuery < Query
  base_query Badge.all

  def add_name_filter(value)
    query.where(name:value)
  end

  def add_description_filter(value)
    query.where(description:value)
  end

  def add_points_filter(value)
    query.where(points:points)
  end

  def add_email_filter(value)
    query.joins(:players).where(players:{email:value})
  end

  def add_project_filter(value)
    project = Project.find_by(name:value)
    query.where(project:project)
  end

  def add_type_filter(value)
    query.where(badge_type:value)
  end


end

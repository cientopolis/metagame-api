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


end

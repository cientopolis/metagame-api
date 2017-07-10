class PlayerQuery < Query
  base_query Player.all

  def add_email_filter(value)
    query.where(email:value)
  end


end

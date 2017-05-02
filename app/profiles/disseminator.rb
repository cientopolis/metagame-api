class Disseminator < ScientistProfile

  def self.matches(player)
    player.badges_by_type("dissemination").count >= 5
  end

end

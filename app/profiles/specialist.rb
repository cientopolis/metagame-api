class Specialist < ScientistProfile

  def self.name
    "Specialist"
  end

  def self.matches(player)
    player.badges_by_type("contribution").count >= 10
  end

end

class Specialist < ScientistProfile

  def name
    "Specialist"
  end

  def self.matches(player)
    player.badges_by_type("contribution").count >= 5
  end
end

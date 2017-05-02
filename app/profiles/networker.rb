class Networker < ScientistProfile

  def self.name
    "Networker"
  end

  def self.matches(player)
    player.badges_by_type("reinforcement").count >= 10
  end

end

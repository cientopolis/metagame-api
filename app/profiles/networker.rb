class Networker < ScientistProfile

  def name
    "Networker"
  end

  def self.matches(player)
    player.badges_by_type("reinforcement").count >= 5
  end
end

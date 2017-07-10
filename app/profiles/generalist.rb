class Generalist < ScientistProfile

  def name
    "Generalist"
  end

  def self.matches(player)
    player.projects.count >= 5
  end

end

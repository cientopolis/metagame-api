class Generalist < ScientistProfile

  def self.name
    "Generalist"
  end

  def self.matches(player)
    player.projects.count >= 5
  end

end

class Visitor < PlayerRank

  BADGES = [ENV["I_WAS_HERE_BADGE"],ENV["WELCOME_BACK_BADGE"]]

  def reevaluate_rank(player)
    if has_tutorial_badges(player)
      player.rank = Explorer.new
    end

  end

  def has_tutorial_badges(player)
    player.has_badges?(neccessary_badges)
  end

  def neccesary_badges
    BADGES.map { |badge_name| Badge.find_by(name:badge_name) }
  end

  def meme
    "memees"
  end

end



class Explorer < PlayerRank

  def reevaluate_rank(player)
    if has_one_of_each_type(player)
      player.promote_rank(PlayerRank.citizen_scientist)
    end
  end

  private
  def has_one_of_each_type(player)
    player.has_badge_of_type?("contribution") &&
    player.has_badge_of_type?("reinforcement") &&
    player.has_badge_of_type?("dissemination")
  end

end

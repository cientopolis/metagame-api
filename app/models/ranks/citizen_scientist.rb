class CitizenScientist < PlayerRank

  def reevaluate_rank(player)
    if has_ten_new_badges(player)
      player.promote_rank(PlayerRank.prolific_citizen_scientist)
    end

  end

  private
  def has_ten_new_badges(player)
    player.badges_issued_after(player.promoted_on).count >= 10
  end

end


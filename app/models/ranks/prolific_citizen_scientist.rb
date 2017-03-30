class ProlificCitizenScientist < SpecializedScientist

  def reevaluate_rank(player)
    if shows_regular_activity_last_month(player)
      player.promote_rank(PlayerRank.commited_citizen_scientist)
    end
  end

  def shows_regular_activity_last_month(player)
    player.last_activity.month == DateTime.now.month
  end

end

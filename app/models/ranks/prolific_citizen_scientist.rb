class ProlificCitizenScientist < SpecializedScientist

  def reevaluate_rank(player)
    player.promote_rank(PlayerRank.prolific_citizen_scientist)
  end

end

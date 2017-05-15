class StatisticsController < ApplicationController

  def total_players
    render json: {total_players: Player.all.count}
  end

end

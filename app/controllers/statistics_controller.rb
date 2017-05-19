class StatisticsController < ApplicationController

  def total_players
    render json: {total_players: Player.all.count}
  end

  def players_distribution
    render json: {
      players_distribution:
      {
        total_visitors:     Player.where(rank:PlayerRank.visitor).count,
        total_explorers:    Player.where(rank:PlayerRank.explorer).count,
        total_cs:           Player.where(rank:PlayerRank.citizen_scientist).count,
        total_prolific_cs:  Player.where(rank:PlayerRank.prolific_citizen_scientist).count,
        total_commited_cs:  Player.where(rank:PlayerRank.commited_citizen_scientist).count,
        total_visionary_cs: Player.where(rank:PlayerRank.visionary_citizen_scientist).count
      }
    }
  end

  def daily_activity
    days=*(Date.today.at_beginning_of_month..Date.today)
    result = Hash[days.collect { |day| [day, count_badges_of_day(day)] }]
    render json: { daily_activity: result}
  end

  def boredom_dropouts
    #return the total of players who doesn't have activity in the last 2 months.
  end

  def one_time_visitors
    #return the total of players which remains as visitors in the last month.
  end

  private
  def count_badges_of_day(date)
    Issue.where(:created_at => (date.beginning_of_day..date.end_of_day)).count
  end

end

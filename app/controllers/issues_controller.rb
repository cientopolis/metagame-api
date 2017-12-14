class IssuesController < ApplicationController
  before_action :set_player, only: [:create, :destroy]
  before_action :set_badge, only: [:create, :destroy]

  def create
    if @player && @badge
      return player_has_badge_response if @player.has_badge?(@badge)
      @player.add_badge(@badge)
      @player.save!
      response = { ok: 'Badge granted to player successfully'}
    else
      response = { error: 'Badge or Player not found'}
    end
    render json: response
  end

  def destroy
    if @player && @badge
      return player_has_no_badge_response unless @player.has_badge?(@badge)
      @player.remove_badge(@badge)
      @player.save!
      response = { ok: 'Badge revoked from player successfully'}
    else
      response = { error:'Badge or Player not found'}
    end
    render json: response
  end


  private

  def issues_params
    params.permit(:email, :badge_id)
  end

  def player_has_badge_response
    render json: { error: 'Player already has the badge' }
  end

  def player_has_no_badge_response
    render json: { error: "Player doesn't have the badge" }
  end

  def set_player
    @player = Player.find_by_email(params[:email])
  end

  def set_badge
    @badge = Badge.find(params[:badge_id])
  end
end

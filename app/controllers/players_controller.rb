class PlayersController < ApplicationController

  before_action :set_player, only: [:update,:destroy,:show]
  #respond_to :json
  # GET /players
  # GET /players.json
  def index
    @players = PlayerQuery.new.result(player_params).all
    render json: @players
  end

  # GET /players/1
  # GET /players/1.json
  def show
    render json: @player
  end

  def player_info
    @player = Player.find_by_email(params[:email])
    return render json:{player:{}} unless @player
    render json: {
      player: {
        email: @player.email,
        rank: @player.rank.name,
        profile: @player.profile.name,
        badges: @player.badges
        }
      }
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    if @player.update(player_params)
      render json: @player, status: :ok
    else
      render json: {error: @player.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy!

    render json: {deleted: "Player has been deleted successfully"}

  end

  private

    def set_player
      @player = Player.find(params[:id])
      raise ActiveRecord::RecordNotFound unless @player
    end

    def player_params
      params.permit(:email,:project)
    end

end

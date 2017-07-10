class PlayersController < ApplicationController

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
    render json: {player: @player}
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
    @player = Player.find(params[:id])

    if @player.update(player_params)
      head :no_content
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy

    head :no_content
  end

  private

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.permit(:email)
    end

end

class ActivityController < ApplicationController

  before_action :create_activity, only: :activity

  def process_activity
    Metagame::Core.issue_deserved_badges(@player_record)
    render json: @player_record
  end

  def contribution

  end

  def reinforcement

  end

  private

  def req_params
    params.permit!
  end

  #Creates an object activity from JSON logs
  def create_activity
    @player  = find_or_create_player(req_params[:email])
    project = Project.find_by(name:req_params[:project])
    type    = ActivityType.find_by(name:req_params[:event])
    activity = Activity.new(player,project,type,(req_params[:count] || 1))
    @player_record = player.record_activity(activity)
    player.save!
  end

  #Find or create player
  def find_or_create_player(email)
    Player.find_by(email:email) || Player.create(email:email)
  end



end

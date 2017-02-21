class ActivitiesController < ApplicationController

  before_action :create_activity, only: :record_activity

  def record_activity
    Metagame::Core.issue_deserved_badges(@player_record)
    render json: @player_record
  end


  private

  def req_params
    params.permit(:email,:project,:event,:count)
  end

  #Creates an object activity from JSON logs
  def create_activity
    player  = find_or_create_player(req_params[:email])
    project = Project.find_by(name:req_params[:project])
    type    = ActivityType.find_by(name:req_params[:event])
    activity = Activity.new(player,project,type,(req_params[:count] || 1))

    if activity.project && activity.type
      @player_record = player.record_activity(activity)
      player.save!
    else
      raise "Project name or type invalid"
    end

  end

  #Find or create player
  def find_or_create_player(email)
    Player.find_by(email:email) || Player.create(email:email)
  end


end

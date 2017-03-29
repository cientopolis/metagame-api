class ActivitiesController < ApplicationController

  before_action :create_activity, only: :record_activity

  def record_activity

    if @activity && @activity.project
      player_record = @activity.player.record_activity(@activity)
      @activity.player.save!
    else
      raise "Project name or event type invalid"
    end

  end

  private

  def req_params
    params.permit(:email,:project,:event,:count)
  end

  #Creates an object activity from JSON logs
  def create_activity
    player  = Player.find_or_create_by(email:req_params[:email])
    project = Project.find_by(name:req_params[:project])
    event = req_params[:event]
    count = req_params[:count]
    @activity = Activity.get_activity_type(player,event,project,count)

  end


end

class ActivitiesController < ApplicationController

  before_action :create_activity, only: :record_activity

  def record_activity

    if @activity && @activity.project
      @player_record = @activity.player.record_activity(@activity)
      #@player.save!
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
    player  = find_or_create_player(req_params[:email])
    project = Project.find_by(name:req_params[:project])
    @activity = Activity.get_activity_type(player,req_params[:event],project)

  end

  #Find or create player
  def find_or_create_player(email)
    Player.find_by(email:email) || Player.create(email:email)
  end


end

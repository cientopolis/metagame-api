class MainController < ApplicationController

  def index
    render json: {"Welcome-to":"Metagame v1"}
  end

end

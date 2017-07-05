class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :update, :destroy]
  before_action :new_badge, only: :create

  # GET /badges
  # GET /badges.json
  def index
    query = BadgeQuery.new
    render json: query.result(req_params)
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    render json: @badge
  end

  # POST /badges
  # POST /badges.json
  def create

    if @new_badge.save
      render json: @new_badge, status: :created, location: @new_badge
    else
      render json: @new_badge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    @badge = Badge.find(params[:id])

    if @badge.update(badge_params)
      head :no_content
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    head :no_content
  end

  private

    def set_badge
      @badge = Badge.find(badge_params[:id])
    end

    def badge_params
      params.permit(:id,:name,:description,:points,:project,:type)
    end

    def req_params
      params.permit(:name,:project,:email,:type)
    end

    def new_badge
      project = Project.find_by(name:req_params[:project])
      @new_badge = Badge.new(badge_params)
      @new_badge.project = project if project

    end

end

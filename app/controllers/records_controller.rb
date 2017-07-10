class RecordsController < ApplicationController

  before_action :set_query

  def index
    render json: query_result
  end

  def login
    render json: query_result.map { |record| record.login_record }
  end

  def contribution
    render json: query_result.map { |record| record.contribution_record }
  end

  def reinforcement
    render json: query_result.map { |record| record.reinforcement_record }
  end

  def dissemination
    render json: query_result.map { |record| record.dissemination_record }
  end

  private
  def req_params
    params.permit(:email,:project)
  end

  def set_query
    @query = RecordQuery.new
  end

  def query_result
    @query.result(req_params).all
  end

end

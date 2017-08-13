class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred
  # Don't resuce from Exception as it will resuce from everything as mentioned here "http://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby" Thanks for @Thibaut Barrère for mention that
  #rescue_from ::Exception, with: :error_occurred

  before_action :authenticate

  protected

  # Obtener autorización a partir de Token HTTP Authentication y token de proyecto.
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      permissible = Project.find_by(token_value:token)
      permissible.present?
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {error:'Bad credentials'}.to_json, status: 401
  end


  def record_not_found(exception)
    render json: {error: "Couldn't find entity. Check your params."}.to_json, status: 404
    return
  end

  def error_occurred(exception)
    render json: {error: exception.message}.to_json, status: 500
    return
  end


end

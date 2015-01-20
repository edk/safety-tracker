class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :authenticate

  protected
  
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      ApiKey.find_by token: token
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'

    respond_to do |format|
      format.json { render json: 'Bad Credentials', status: 401}
      format.html { render html: 'Bad Credentials', status: 401}
    end
  end

end

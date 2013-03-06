class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    render 'index.html.haml'
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def base_action
    render html: "I am from the ApplicationController"
  end
end

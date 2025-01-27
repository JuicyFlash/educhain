class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_turbo_param

  def set_turbo_param
    @turbo_param = params[:turbo] == "true" || params[:turbo].nil? ? true : false
  end
end

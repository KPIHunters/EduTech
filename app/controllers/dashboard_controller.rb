class DashboardController < ApplicationController
  def index; end

  def recent
    redirect_to dashboard_path if @current_user.admin
  end

  def intro
    @intro_video = @app.nil? || @app.intro_video.nil? ? App::GENERIC_INTRO : @app.intro_video
    @intro_video = "https://www.youtube.com/embed/#{@intro_video}" if @intro_video.index('http').nil?
  end
end

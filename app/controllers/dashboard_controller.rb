class DashboardController < ApplicationController
  def index; end

  def recent
    redirect_to dashboard_path if @current_user.admin
  end
end

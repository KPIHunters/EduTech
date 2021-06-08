class ApplicationController < ActionController::Base
  # Requirements before processing the request
  protect_from_forgery with: :exception
  before_action :setup_user, unless: :login_not_required
  before_action :simple_permission_checker
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_sidebar
  before_action :set_locale
  # TODO fix it in future
  skip_before_action :verify_authenticity_token

  # Update user locale
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  # 404 Rendered
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

  # Config devise params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[locale name email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login email password remember_me otp_attempt])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[password password_confirmation current_password])
    @current_user ||= current_user
  end

  # Call the Authenticate & set it @current_user up
  def setup_user
    current_user.nil? ? authenticate_user! : @current_user = current_user
  end

  # Every controller which doesn't need session, like API, must change it
  def login_not_required
    false
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def set_sidebar
    # TODO refactor for HotMarket model in future
    unless @current_user.nil?
      @course = Course.first
      @periods = @course.periods
    end
  end

  def simple_permission_checker
    return if "#{params[:controller]}/#{params[:action]}" == 'users/sessions/destroy'
    if !@current_user.nil? && !@current_user.admin && !%w[profiles dashboard].include?(params[:controller])
      if params[:action] != 'show'
        redirect_to root_path
      end
    end
  end
end

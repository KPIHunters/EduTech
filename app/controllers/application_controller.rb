class ApplicationController < ActionController::Base
  # Dependencies
  include ApplicationHelper

  # Requirements before processing the request
  protect_from_forgery with: :exception
  before_action :setup_app
  before_action :setup_user, unless: :login_not_required
  before_action :simple_permission_checker
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_sidebar
  before_action :set_locale
  # TODO: fix it in future
  skip_before_action :verify_authenticity_token

  # Update user locale
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  # 404 Rendered
  def not_found
    raise ActionController::RoutingError, 'Not Found'
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
    return if devise_controller?
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

  def setup_app
    request_domain = request.domain
    request_domain = "#{request_domain}:#{request.port}" if request_domain == 'localhost'
    @app = App.where(domain: request_domain).take
  end

  def set_sidebar
    if admin_course? and not devise_controller?
      @course = Course.first
      @periods = @course.periods
    end
  end

  def simple_permission_checker
    return if "#{params[:controller]}/#{params[:action]}" == 'users/sessions/destroy'

    forbidden = false

    # if only the admin can manage the courses/lessons
    if NENV['ONLY_ADMIN_COURSE'] == '1'
      not_admin = (!@current_user.nil? && !@current_user.admin && !%w[profiles dashboard].include?(params[:controller]))
      forbidden = true if not_admin && params[:action] != 'show'
    elsif devise_controller?
      forbidden = false
    elsif (@current_user.nil? && !devise_controller?) && ![Role::PUBLISHER, Role::ADMIN].include?(@current_user.role_id)
      forbidden = true
    end

    redirect_to root_path, warning: 'Você não possui permissão para acessar esta página' if forbidden
  end

end

# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'sign'
  before_action :setup_dependencies

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  after_action :setup_pending_mail, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    flash[:info] = 'Lembre-se de confirmar seu email'
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
    # Setup Cookies to show up the email pending page
    def setup_pending_mail
      # TODO: refactor if using parallelism on server REMOVE/REFACTOR IT
      session[:pending_mail] = User.last.id
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[locale full_name email email_confirmation password password_confirmation remember_me])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[locale full_name email email_confirmation password password_confirmation company_fantasy_name company_legal_name website description timezone gov_id_pf remember_me])
    end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
    def setup_dependencies
    end
end

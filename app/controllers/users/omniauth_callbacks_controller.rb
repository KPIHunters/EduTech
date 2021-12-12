# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout 'sign'

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # Create social session based on GitHub received data
  def github
    setup_social_session('GitHub')
  end

  # Create social session based on LinkedIn received data
  def linkedin
    setup_social_session('LinkedIn')
  end

  def setup_social_session(provider)
    @social_session = SocialSession.create_from_oauth(request.env['omniauth.auth'], current_user)
    if @social_session
      redirect_to new_profile_path, notice: t('screen.oauth.signed', provider: provider)
    else
      redirect_to new_profile_path, notice: t('screen.oauth.not_signed', provider: provider)
    end
  end
  
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

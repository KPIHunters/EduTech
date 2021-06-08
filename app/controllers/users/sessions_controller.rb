# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'sign'

  # before_action :check_pending_mail_confirmation
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private
  # def check_pending_mail_confirmation
  #   unless params[:user].nil?
  #     usr = User.find_by(email: params[:user][:email])
  #
  #     if usr.nil?
  #       flash[:error] = 'Usuário não encontrado. Faça seu cadastro para continuar'
  #     elsif usr.confirmed_at.nil? and flash[:warning].nil?
  #       flash[:warning] = 'Você precisa confirmar seu e-mail'
  #       # redirect_to pending_mail_url
  #     else
  #       flash[:error] = 'Senha inválida, corriga-a e tente novamente'
  #     end
  #   end
  # end
end

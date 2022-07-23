# frozen_string_literal: true

class Players::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_resource, only: :destroy
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    Rails.logger.debug "IN HEREEEE"
    super
    redirect_to new_player_session_path && return
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

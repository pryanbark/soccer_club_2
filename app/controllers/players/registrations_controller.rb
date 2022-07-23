# frozen_string_literal: true

class Players::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_resource, except: [:new, :create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    Rails.logger.debug current_player.id
    Rails.logger.debug "HERE I AM"
    redirect_to players_dashboard_index_path && return
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    Rails.logger.debug "Player: #{current_player.id}"
    if params[:playing]=="stop" && current_player.owner
      current_player.update(owner_id: nil)
    else
      Rails.logger.debug account_update_params
      current_player.update(account_update_params)
    end
    redirect_to players_dashboard_index_path && return
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def sign_up_params
    params.require(:player).permit(:email, :full_name, :password, :password_confirmation, :is_available, :position)
  end

  def account_update_params
    params.require(:player).permit(:full_name, :is_available, :position)
  end
end

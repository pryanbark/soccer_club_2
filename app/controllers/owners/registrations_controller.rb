# frozen_string_literal: true

class Owners::RegistrationsController < Devise::RegistrationsController
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
    redirect_to owners_dashboard_index_path && return
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    if params[:player_id]
      player = Player.find(params[:player_id])
      if player.is_available && player&.owner_id.nil?
        if current_owner.players.count<15
          player.update(owner_id: current_owner.id)
          flash[:notice] = "Player is added successfully"
        else
          flash[:alert] = "Your team has already crossed maximum limit of 15 players"
        end
      else
        flash[:alert] = "Player isnt available for grab"
      end
    else
      current_owner.update(account_update_params)
      flash[:notice] = "Owner updated successfully"
    end
    redirect_to owners_dashboard_index_path
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
    params.require(:owner).permit(:email, :password, :password_confirmation, :club_name)
  end

  def account_update_params
    params.require(:owner).permit(:club_name)
  end
end

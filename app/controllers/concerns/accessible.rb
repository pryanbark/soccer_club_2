module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_resource
  end

  protected

  def check_resource
    if user_signed_in?
      flash.clear
      redirect_to(users_authenticated_root_path) and return
    elsif player_signed_in?
      flash.clear
      redirect_to(players_authenticated_root_path) and return
    elsif owner_signed_in?
      flash.clear
      redirect_to(owners_authenticated_root_path) and return
    end
  end
end
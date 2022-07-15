class HomeController < ApplicationController
  def index
    if current_player
      redirect_to players_dashboard_index_path
    elsif current_owner
      redirect_to owners_dashboard_index_path
    end
  end
end

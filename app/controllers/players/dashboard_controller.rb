class Players::DashboardController < ApplicationController
  # This controller manages the dashboard logic of Players
  def index
  end

  def team
    unless current_player.owner
      redirect_to players_dashboard_index_path && return
    end
  end
end

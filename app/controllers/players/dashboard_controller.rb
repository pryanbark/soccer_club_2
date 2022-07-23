class Players::DashboardController < ApplicationController
  def index
  end

  def team
    unless current_player.owner
      redirect_to players_dashboard_index_path && return
    end
  end
end

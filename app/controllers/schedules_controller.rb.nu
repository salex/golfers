class SchedulesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def update
  end

  def form_teams
  end
end

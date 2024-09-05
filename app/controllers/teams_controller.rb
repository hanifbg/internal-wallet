class TeamsController < ApplicationController
  def show
    team = Team.find(params[:id])
    render json: team, include: :wallet
  end

  def index
    teams = Team.all
    render json: teams, include: :wallet
  end
end

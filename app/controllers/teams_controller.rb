class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    @game = @team.next_game
  end
end

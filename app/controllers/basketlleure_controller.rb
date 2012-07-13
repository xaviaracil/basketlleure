class BasketlleureController < ApplicationController
  def index
    @teams = Team.all
    @games = Game.next_games
  end
end

class BasketlleureController < ApplicationController
  def index
    @teams = Team.all
  end
end

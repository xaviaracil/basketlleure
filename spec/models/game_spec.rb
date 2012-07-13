require 'spec_helper'

describe Game do
  it 'should always have local and visitor' do
    game = Game.new 
    assert !game.save
  end
  
  it 'should always have a date' do
    game = Game.new 
    assert !game.save
  end
  
  it 'should always have a division' do
    game = Game.new 
    assert !game.save
  end
  
  it 'should always have a day' do
    game = Game.new 
    assert !game.save
  end
    
  it 'should return games for the next day' do  
    season = Season.create :year => 2012
    division = season.divisions.create(:name => 'Primera', :current_day => 2)
    division2 = season.divisions.create(:name => 'Segona', :current_day => 1)
    local = Team.create :name => "Local"
    visitor = Team.create :name => "Visitor"
    
    game1 = division.games.create(:local_id => local.id, :visitor_id => visitor.id, :date => 5.days.from_now, :day => 2)
    game2 = division.games.create(:local_id => visitor.id, :visitor_id => local.id, :date => 5.days.ago, :day => 1)
    game3 = division2.games.create(:local_id => visitor.id, :visitor_id => local.id, :date => 10.days.from_now, :day => 2)
    game4 = division2.games.create(:local_id => local.id, :visitor_id => visitor.id, :date => 10.days.ago, :day => 1)
    
    next_games = Game.next_games
    next_games.size.should be 2
    next_games.should include game1
    next_games.should include game4
  end
end

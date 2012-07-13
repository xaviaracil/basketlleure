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
  
  it 'should return games for the next weekend' do
    season = Season.create :year => 2012
    division = season.divisions.create(:name => 'Primera')
    local = Team.create :name => "Local"
    visitor = Team.create :name => "Visitor"
    
    game1 = division.games.create(:local_id => local.id, :visitor_id => visitor.id, :date => 5.days.from_now)
    game2 = division.games.create(:local_id => visitor.id, :visitor_id => local.id, :date => 5.days.ago)
    
    next_games = Game.next_games
    next_games.size.should be 1
    next_games.first.should == game1
  end
end

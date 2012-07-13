require 'spec_helper'

describe Team do
  it 'should always have a name' do 
    team = Team.new 
    assert !team.save
  end    

  it 'should always have unique name' do
    team = Team.new :name => 'Equip'
    assert team.save
    team2 = Team.new :name => 'Equip'
    assert !team2.save
  end
  
  describe 'next_game' do
    it 'should fetch next game of team in team\'s divison' do
      division = FactoryGirl.build :division, :name => 'Primera', :current_day => 3
      team = FactoryGirl.build :team, :division => division
      local_games = [FactoryGirl.build(:game, :day => 1)]
      game = FactoryGirl.build(:game, :day => 3)
      visitor_games = [FactoryGirl.build(:game, :day => 2), game]
      
      local_games.stub(:find_by_day).and_return(nil)
      visitor_games.stub(:find_by_day).and_return(game)
      team.should_receive(:local_games).and_return(local_games)
      team.should_receive(:visitor_games).and_return(visitor_games)
      team.should_receive(:division).twice.and_return(division)
      team.next_game.should == game
    end
  end
end

require 'spec_helper'

describe Division do
  before :each do
    @season = Season.new :year => 2012
    assert @season.save
  end
  
  it 'should always have a name' do
    division = Division.new
    assert !division.save
  end
  
  describe 'test with existing division' do
    before :each do 
      @division = @season.divisions.build :name => 'Primera'
      assert @division.save
    end
    
    it 'should always have an unique name for a given season' do
      
      division = @season.divisions.create(:name => 'Primera')
      assert !division.save
      
      season2 = Season.new :year => 2013 
      assert season2.save
      assert season2.divisions.create :name => 'Primera'
    end
    
    it 'should always have an unique game for a given season' do
      local = Team.create :name => "Local"
      visitor = Team.create :name => "Visitor"
      assert @division.games.create(:local_id => local.id, :visitor_id => visitor.id, :date => 5.days.from_now)
      game = @division.games.build :local_id => local.id, :visitor_id => visitor.id, :date => 5.days.from_now
      assert !game.save
    end

  end
end

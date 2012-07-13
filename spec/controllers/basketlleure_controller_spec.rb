require 'spec_helper'

describe BasketlleureController do

  describe "GET 'index'" do
    before :each do 
      @fake_teams = [FactoryGirl.build(:team), FactoryGirl.build(:team)]
      Team.should_receive(:all).and_return(@fake_teams)
    end
    
    it "returns http success" do
      get 'index'
      response.should be_success
    end
        
    it 'should retrieve all the teams' do
      get 'index'
    end
    
    it 'should select the index template for rendering' do
      get 'index'
      response.should render_template('index')
    end
    
    it 'should make the teams available to that template' do
      get 'index'
      assigns(:teams).should == @fake_teams
    end

    describe 'games' do
      before :each do 
        @fake_games = [FactoryGirl.build(:game), FactoryGirl.build(:game)]
        Game.should_receive(:next_games).and_return(@fake_games)
        get 'index'
      end

      it 'should retrieve next games' do
      end
  
      it 'should make the games available to that template' do
        assigns(:games).should == @fake_games
      end
    end    
  end

end

require 'spec_helper'

describe BasketlleureController do

  describe "GET 'index'" do
    before :each do 
      @fake_teams = [FactoryGirl.build(:team), FactoryGirl.build(:team)]
      Team.should_receive(:all).and_return(@fake_teams)
      get 'index'
    end
    
    it "returns http success" do
      response.should be_success
    end
        
    it 'should retrieve all the teams' do
    end
    
    it 'should select the index template for rendering' do
      response.should render_template('index')
    end
    
    it 'should make the search results available to that template' do
      assigns(:teams).should == @fake_teams
    end
  end

end

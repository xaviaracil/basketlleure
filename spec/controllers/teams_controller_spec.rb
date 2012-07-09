require 'spec_helper'

describe TeamsController do
  describe "show team" do  
    before :each do
      @fake_team = FactoryGirl.build(:team)
      Team.should_receive(:find).with('1').and_return(@fake_team)
      get :show, {:id => 1}
    end
    it "returns http success" do
      response.should be_success
    end
    
    it 'should retrieve the team from the model' do
    end
    
    it 'should select the show template for rendering' do
      response.should render_template('show')
    end
    
    it 'should make the team available to that template' do
      assigns(:team).should == @fake_team
    end
  end
  
end

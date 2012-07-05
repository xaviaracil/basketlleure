require 'spec_helper'

describe Team do
  it 'should always have a name' do 
    team = Team.new 
    assert !team.save
  end  
end

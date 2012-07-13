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
  
end

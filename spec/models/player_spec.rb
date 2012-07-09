require 'spec_helper'

describe Player do
  it 'should always have a number' do 
    player = Player.new 
    assert !player.save
  end  

  it 'should always have a name' do 
    player = Player.new 
    assert !player.save
  end  
  
  it 'should always have a team' do 
    player = Player.new 
    assert !player.save
  end  
end

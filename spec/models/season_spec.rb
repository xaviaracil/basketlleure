require 'spec_helper'

describe Season do
  it 'should always have a name' do 
    season = Season.new 
    assert !season.save
  end    
  
  it 'should always have unique year' do
    season = Season.new :year => 2012.to_s
    assert season.save
    season2 = Season.new :year => 2012.to_s
    assert !season2.save
  end
end

class Team < ActiveRecord::Base
  attr_accessible :logo, :name
  validates_presence_of :name
end

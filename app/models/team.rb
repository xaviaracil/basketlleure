class Team < ActiveRecord::Base
  attr_accessible :logo, :name
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :players
end

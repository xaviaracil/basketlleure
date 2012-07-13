class Season < ActiveRecord::Base
  validates_presence_of :year
  validates_uniqueness_of :year
  has_many :divisions, :dependent => :destroy
  attr_accessible :year
  
end

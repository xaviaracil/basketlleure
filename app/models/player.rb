class Player < ActiveRecord::Base
  attr_accessible :name, :number, :photo
  validates_presence_of :name
  validates_presence_of :number
  validates_uniqueness_of :number, :scope => :team_id
  validates_uniqueness_of :name
end

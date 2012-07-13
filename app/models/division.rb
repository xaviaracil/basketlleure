class Division < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :season_id
  belongs_to :season
  has_many :games, :dependent => :destroy
  attr_accessible :name, :season_id
end

class Team < ActiveRecord::Base
  attr_accessible :logo, :name, :division
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :players
  belongs_to :division
  has_many :local_games, :class_name => 'Game', :foreign_key => :local_id
  has_many :visitor_games, :class_name => 'Game', :foreign_key => :visitor_id 
  
  def next_game
    return nil unless self.division    
    local_games.find_by_day(self.division.current_day) || visitor_games.find_by_day(self.division.current_day)
  end
end

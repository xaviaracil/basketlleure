class Game < ActiveRecord::Base
  validates_presence_of :local_id, :visitor_id, :date, :division_id, :day
  validates_uniqueness_of :local_id, :scope => [:division_id, :visitor_id]
  validates_uniqueness_of :visitor_id, :scope => [:division_id, :local_id]
  
  belongs_to :division
  belongs_to :local, :class_name => "Team"
  belongs_to :visitor, :class_name => "Team"

  attr_accessible :date, :local_id, :local_score, :visitor_id, :visitor_score

  def self.next_games 
    find :all, :conditions => ["date > ?", DateTime.now]
  end
end

Given /^the following games exist:$/ do |table|
  table.hashes.each do |game|
    division = Division.find_by_name game[:division]

    local = Team.find_or_create_by_name game[:local]
    local.division = division
    local.save!
    visitor = Team.find_or_create_by_name game[:visitor]
    visitor.division = division
    visitor.save!
    
    division.games.create :local_id => local.id, :visitor_id => visitor.id, :day => game[:day], :date => game[:days_from_now].to_i.days.from_now 
  end
end
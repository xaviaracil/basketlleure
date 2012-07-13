Given /^the following games exist:$/ do |table|
  table.hashes.each do |game|
    local = Team.find_or_create_by_name game[:local]
    visitor = Team.find_or_create_by_name game[:visitor]
    division = Division.find_or_create_by_name game[:division]
    
    division.games.create :local_id => local.id, :visitor_id => visitor.id, :date => game[:days_from_now].to_i.days.from_now 
  end
end
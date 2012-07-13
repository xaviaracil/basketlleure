Given /^the following division exist:$/ do |table|
  table.hashes.each do |division|
    Division.create! division.merge({:season_id => 1})
  end
end
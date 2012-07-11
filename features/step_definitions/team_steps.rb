Given /^the following teams exist:$/ do |table|
  # table is a Cucumber::Ast::Table  
  table.hashes.each do |team|
    Team.create! team
  end
end

Given /^the following roster for "(.*?)" exist:$/ do |team_name, table|
  # table is a Cucumber::Ast::Table
  team = Team.find_by_name team_name
  table.hashes.each do |player|
     # Player.create player
     team.players.create player
  end
end

Then /^I should see "(.*)" before "(.*)"$/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  regexp = /#{e1}.*#{e2}/m
  assert page.body =~ regexp, "#{e1} should be before #{e2}"
end


Then /^the photo of "(.*?)" should be empty$/ do |player_name|
  player = Player.find_by_name player_name
  
  page.should have_content player_name
  page.should have_css "#photo_#{player.id}"
  page.find_by_id("photo_#{player.id}")[:src].should == "/assets/player.png"
end
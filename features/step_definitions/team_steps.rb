Given /^the following teams exist:$/ do |table|
  # table is a Cucumber::Ast::Table  
  table.hashes.each do |team|
    Team.create! team
  end
end
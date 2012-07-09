Feature: See team's data

  As a visitor 
  I want to see standing and next play of the team
  So I can follow team's evolution
  
Scenario: see team's data

  Given the following teams exist: 
  | name | logo |
  | Comodines | logo|

  When I am on the Basket Lleure home page  
  And I follow "Comodines"
  Then I should be on the team details page for "Comodines"
  And I should see "Comodines"
  And I should see "Standing"
  And I should see "Next Game"
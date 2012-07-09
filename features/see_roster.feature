Feature: See team's roster

  As a team member
  I want to see my roster
  So I can send them a message
  
Scenario: See team's roster
  Given the following teams exist: 
  | name      | logo |
  | Comodines | logo |
  
  And the following roster for "Comodines" exist:
  | number | name        | photo |
  | 12     | Xavi Aracil | foto  |
  | 23     | Ceci Fimia  | foto  |

  When I am on the Basket Lleure home page  
  And I follow "Comodines"
  Then I should be on the team details page for "Comodines"
  And I should see "Comodines"
  And I should see "Roster"
  And I should see "Xavi Aracil" before "Ceci Fimia"

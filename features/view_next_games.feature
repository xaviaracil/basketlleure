Feature: View next games
  As a visitor
  I want to see next games
  So I can add a games to my calendar  

Background: Teams and Games added to database
  
  Given the following teams exist: 
  | name      | logo |
  | Comodines | logo |
  | Teresina  | logo |
  
  And the following games exist:
  | local     | visitor   | division | days_from_now |   
  | Comodines | Teresina  |  Primera |  10           |
  | Teresina  | Comodines |  Primera |  20           |

Scenario: View next games (Main Page)

  When I am on the Basket Lleure home page  
  Then I should see "Next Games"
  And I should see "Comodines VS Teresina"
  And I should see "Teresina VS Comodines"
  
Scenario: View next games (Team's Page)

  When I am on the Basket Lleure home page  
  And I follow "Comodines"
  Then I should be on the team details page for "Comodines"
  And I should see "Comodines"
  And I should see "Next Game"
  And I should see "Teresina"
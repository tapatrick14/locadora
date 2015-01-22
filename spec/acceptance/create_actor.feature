Feature: Create a new Actor
  As an User
  I want to add a new actor

  Scenario: Create a actor in the home page
    Given I visted the cadastre page to actor
    When I filled out form of the actor correctly
    Then I should see a sign in success message of the actor

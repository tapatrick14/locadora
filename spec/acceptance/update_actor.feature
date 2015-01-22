Feature: Update a actor
  As an user
  I want to modify a actor

  Scenario: Modify on the home page
    Given give I have a actor
    And I visted the show page of the actor to update
    When I chossed the actor to update
    And I fill in a form of the actor with new attributes
    Then the actor is modify with success
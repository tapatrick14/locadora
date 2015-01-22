@javascript
Feature: Destroy a actor
  As an user
  I want to delete a actor

  Scenario: Delete a actor in the home page 
    Given give I have a actor
    And I visted the show page of the actor to delete
    When I chossed the actor to delete
    Then Confirm if I want to delete the actor
    Then the actor is deleted

  Scenario: Delete a actor in the home page 
    Given give I have a actor
    And I visted the show page of the actor to delete
    When I chossed the actor to delete
    Then Confirm if I dont want to delete the actor
    Then the actor isnt deleted
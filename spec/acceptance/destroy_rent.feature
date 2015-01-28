@javascript
Feature: Destroy a rent
  As an user
  I want to delete a rent

Background:
  Given give give I have a rent
  And I visted the show page of the rent to delete
  When I chossed the rent to delete

  Scenario: Delete a rent in the home page 
    Then Confirm if I want to delete the rent
    Then the rent is deleted

  Scenario: Delete a rent in the home page 
    Then Confirm if I dont want to delete the rent
    Then the rent isnt deleted 
Feature: Update a rent
  As an user
  I want to modify a rent

  Scenario: Modify on the home page
    Given I have a rent
    And I visted the show page of the rent to update
    When I chossed the rent to update
    And I fill in a form of the rent with new attributes
    Then the rent is modify with success

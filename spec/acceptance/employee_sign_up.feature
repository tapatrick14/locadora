Feature: Create a new employee login
  as an User
  I want to add a new employee

Background:
  Given There is a employee
  When I click in Sign Up

  Scenario: Fill in the fields correctly
    And I filled new employee form correctly
    Then I should see the home page

  Scenario: Fill in the fields incorrectly
    And I filled new employee form incorrectly
    Then I should see the sign up page again with the errors

  Scenario: Fill in the field password confirmation incorrectly
    And I filled new employee form incorrectly in the field password confirmation
    Then I should see error message

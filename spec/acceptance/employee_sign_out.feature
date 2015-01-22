Feature: Log out
  Background:
    Given I'm logged into the system

  Scenario: I'm in the system and I want out
    When I click in Sign out buttom
    And I should see the log in page


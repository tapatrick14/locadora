Feature: Login in
  as an User
  I want to login in the system

  Scenario: Scenario: Fill in the fields correctly
    Given There is a employee to login
    When I filled correctly with the login
    And I click in Log in buttom
    Then I should see the home page with the user name

  Scenario: Scenario: Fill in the fields incorrectly
    Given There is a employee to login
    When I filled incorrectly with the login
    And I click in Log in buttom
    Then I should see the login page again

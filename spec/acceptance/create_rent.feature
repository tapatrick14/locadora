Feature: Create a rent
  As an user
  I want to do a rent

  Scenario: Create a rent
    Given give I have a movie an a customer
    And I visted the rent page
    When I filled out form of the rent correctly
    Then I should see a sign in success message of the rent


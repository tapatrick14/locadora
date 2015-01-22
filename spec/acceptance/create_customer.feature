Feature: Create a new Customer
  as an User
  I want to add a new customers

Background:
  Given There is a customer
  When I click in new

  Scenario: Fill in the fields correctly
    And I filled new customer form correctly
    Then I should see the new customer

  Scenario: Fill in the fields incorrect  
    And I don't filled new customer form correctly
    Then I should see customer failure message
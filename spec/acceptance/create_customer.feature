Feature: Create a new Customer
  as an User
  I want to add a new customers

Scenario: Fill in the fields correctly
  Given There is a customer
  When I click in new
  And I filled new customer form correctly
  Then I should see the new customer

  Scenario: Fill in the fields incorrect
  Given There is a customer
  When I click in new
  And I don't filled new customer form correctly
  Then I should see customer failure message
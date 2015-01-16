@javascript
Feature: Destroy a  Customers
  As an user
  I want to destroy a customer

Scenario: Delete a customer in the List of Customer page
  Given There is a customer to delete
  When I visit the page List of Customer
  And I click in destroy buttom
  And I click in confirm buttom
  Then I should see customer list
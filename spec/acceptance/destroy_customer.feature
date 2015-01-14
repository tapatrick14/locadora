Feature: Destroy a  Customers
  As an user
  I want to destroy a customer

Scenario: Delete a customer in the home page
  Given I have a customer to delete
  When I give a destroy in the customer
  Then The movie is deleted
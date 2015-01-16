Feature: Update a movie
  As an user
  I want to modify a movie

Scenario: Modify on the List of Customer page
  Given There is a customer to modify
  And I visit the page List of Customer to edit
  When I click in Edit buttom
  And I I fill in a form of the customer with new attributes
  Then The customer is modified with success

Scenario: Modify on the show page
  Given There is a customer to modify
  And I visti the show page of customer
  When I click in Edit buttom
  And I I fill in a form of the customer with new attributes
  Then The customer is modified with success

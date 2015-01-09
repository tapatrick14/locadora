Feature: Update a movie
  As an user
  I want to modify a movie

Scenario: Modify on the home page
	Given I have a customer to modify
  And I fill in a form with new attributes
  When I give Edit in the customer
  Then The customer is modified

Scenario: Modify on the show page
  Given I have a customer to modify
  And I fill in a form with new attributes
  When I give Edit in the customer
  Then The customer is modified
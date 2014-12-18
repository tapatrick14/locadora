Feature: Add Customer
	as an User
	I want to add customers 

Scenario Outline:
	Given I want to create a new customer
	And I fill form correctly
	When I create a new customer
	Then The new customer will be added
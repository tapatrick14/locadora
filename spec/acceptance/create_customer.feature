Feature: Create a new Customer
	as an User
	I want to add a new customers

Scenario: Create a customer in the home page
	Given I fill an a form correctly
	When I give add customer
	Then The new customer is created
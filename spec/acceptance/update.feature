Feature: Update Customer
	as an User

Scenario Outline: First Page
	Given I want to edit a customer in the firt page
	When I hava a customer
	And I fill form correcty with the new name, Nome 2 and the new lastname Sobrenome 2
	And I give Edit in the customer
	Then The customer is modify

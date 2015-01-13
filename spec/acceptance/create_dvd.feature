Feature: Create a new Dvd
  as an User
  I want to add a new dvd

Scenario: Create a dvd in the home page
  Given I fill the form correctly dvd
  When I give add dvd
  Then The new dvd is created
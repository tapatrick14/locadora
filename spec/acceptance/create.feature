Feature: Create a new movie
  As an user 
  I want to create a new movie

  Scenario Outline: Create on the home page
    Given I fill in a form correctly
    When I give add in the new movie
    Then the movie is create

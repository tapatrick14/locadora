Feature: Create a new Movie
  As an User
  I want to add a new movie

  Scenario: Create a movie in the home page
    Given I fill an a form correctly
    When I give add movie
    Then the is created


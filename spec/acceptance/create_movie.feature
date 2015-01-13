Feature: Create a new Movie
  As an User
  I want to add a new movie

  Scenario: Create a movie in the home page without created a actor
    Given I fill an a form correctly
    When I give add movie
    Then the movie is created

  Scenario: Create a movie in the home page creting a actor
    Given I created a actor
    And I fill an a form correctly
    When I give add movie
    Then the movie is created

  Scenario: Create a movie in the home page deleting a actor
    Given I deleted a actor
    And I fill an a form correctly
    When I give add movie
    Then the movie is created

  Scenario: Create a movie in the home page updating a actor
    Given I updated a actor
    And I fill an a form correctly
    When I give add movie
    Then the movie is created


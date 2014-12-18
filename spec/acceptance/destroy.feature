Feature: Destroy a movie
  An a user
  I want to delete a movie

  Scenario Outline: Delete on the home page
    Given I have a movie to delete
    When I give a Destroy in the movie
    Then the movie is deleted
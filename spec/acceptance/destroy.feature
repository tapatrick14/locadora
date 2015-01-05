Feature: Destroy a movie
  As an user
  I want to delete a movie

  Scenario: Delete a movie in the home page
    Given I have a movie to delete
    When I give a Destroy in the movie
    Then the movie is deleted
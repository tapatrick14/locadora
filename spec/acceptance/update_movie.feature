Feature: Update a movie
  As an user
  I want to modify a movie

Background:
  Given give I have a movie
  And I visted the show page of the movie to update
  When I chossed the movie to update

  Scenario: Modify on the home page
    And I fill in a form of the movie with new attributes
    Then the movie is modify with success

  Scenario: Modify on the home page
    And I didnt fill in a form of the movie with new attributes
    Then the movie is modify with failure
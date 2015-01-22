@javascript
Feature: Destroy a movie
  As an user
  I want to delete a movie

  Scenario: Delete a movie in the home page 
    Given give I have a movie
    And I visted the show page of the movie to delete
    When I chossed the movie to delete
    Then Confirm if I want to delete the movie
    Then the movie is deleted

  Scenario: Delete a movie in the home page 
    Given give I have a movie
    And I visted the show page of the movie to delete
    When I chossed the movie to delete
    Then Confirm if I dont want to delete the movie
    Then the movie isnt deleted
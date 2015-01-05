Feature: Update a movie
  As an user
  I want to modify a movie

  Scenario: Modify on the home page
    Given I have a movie to modify
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify

  Scenario: Modify on the show page 
    Given I have a movie to modify
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify
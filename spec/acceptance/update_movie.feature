Feature: Update a movie
  As an user
  I want to modify a movie

  Scenario: Modify on the home page without the actor
    Given I have a movie to modify
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify

  Scenario: Modify on the show page without the actor
    Given I have a movie to modify
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify

  Scenario: Modify on the home page with the actor
    Given I have a movie to modify
    And I modifly a actor
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify

  Scenario: Modify on the show page with the actor
    Given I have a movie to modify
    And I modifly a actor
    And I fill in a form with new attributes
    When I give Edit in the movie
    Then the movie is modify
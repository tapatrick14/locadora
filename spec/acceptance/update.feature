Feature: Update a movie
  As an user
  I want to modify a movie

  Scenario Outline: Modify on the home page
    Given I have a movie
    And I fill in a form with new attributes
    When I give Edit in a movie
    Then the movie is modify

  Scenario Outline: Modify on the show page 
    Given I have a movie
    And I fill in a form with new attributes
    When I give Edit in a movie
    Then the movie is modify
Feature: Create a new Movie
  As an User
  I want to add a new movie

Background:
  Given I visted the cadastre page to movie

  Scenario: Create a movie in the home page
    When I filled out form of the movie correctly
    Then I should see a sign in success message of the movie

  Scenario: Create a movie in the home page
    When I didnt fill out form of the movie correctly
    Then I should see a sign in failure message of the movie

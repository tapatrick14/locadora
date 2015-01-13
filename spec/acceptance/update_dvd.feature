Feature: Update a dvd
  As an user
  I want to modify a dvd

Scenario: Modify on the home page
  Given I have a dvd to modify
  And I fill in a form with new attributes
  When I give Edit in the dvd
  Then The dvd is modified

Scenario: Modify on the show page
  Given I have a dvd to modify
  And I fill in a form with new attributes
  When I give Edit in the dvd
  Then The dvd is modified
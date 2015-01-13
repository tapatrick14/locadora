Feature: Destroy a Dvd
  As an user
  I want to destroy a dvd

Scenario: Delete a dvd in the home page
  Given I have a dvd to delete
  When I give a destroy in the dvd
  Then The dvd is deleted
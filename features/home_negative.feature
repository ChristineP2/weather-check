Feature: Error Checks
  As a user
  I want to know if I misuse the app
  So that I may correct my actions

  Scenario: I mistype my zip code
    Given a user is on the home page
    When the user enters a bad zip code and clicks submit
    Then they should receive the US zip code error
    # Add second check for red border on form field.

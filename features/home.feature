Feature: Show weather information
  As a user
  I want to be able to see the weather information for my location
  So that I can plan my day accordingly

  Scenario: Show Today's weather information
    Given a user is on the home page
    When the user enters an address and clicks submit
    Then they should see the location entered
    And they should see the weather tabs
#    And they should see the weather information for Today


#  Scenario: Show Yesterday's weather information
#    Given a user is on the home page
#    When the user enters an address and clicks submit
#    Then they should see the location entered
#    And they should see the weather tabs
#    And they click on the past tab
#    And they should see past weather information
#
#  Scenario: Show the weather forecast
#    Given a user is on the home page
#    When the user enters an address and clicks submit
#    Then they should see the location entered
#    And they should see the weather tabs
#    And they click on the future tab
#    And they should see the Forecast

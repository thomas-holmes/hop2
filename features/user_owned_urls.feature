Feature: As a user I would like to have shortened urls I create to be
  associated to my user account.

  Scenario: Shortened urls should be associated to a user
    Given I am a signed in user
    When I shorten a URL
    Then It should be listed on my user profile page

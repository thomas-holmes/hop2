Feature: As a user I would like to have shortened urls I create to be
  associated to my user account.

  Scenario: Shortened urls should be associated to a user
    Given I am a signed in user
    When I shorten a URL
    Then It should be listed on my user profile page

  Scenario: Shortened url should be listed on the user page
    Given I am a signed in user
      And have a shortened url
    When I visit visit my user profile page
    Then it should have the short code listed

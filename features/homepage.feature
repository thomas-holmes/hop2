Feature: Shorty homepage loads
  In order to more easily link web content I wish to use
  Shorty to create abbreviated links that redirect to the
  desired content

  Scenario: Load shorty homepage
    When I visit the homepage
    Then it should load

  Scenario: The user should be able to submit a url to shorten
    When I visit the homepage
    Then I should be able to submit a url to shorten

  Scenario: A url should be shortened into a url that redirects to the original url
    When I create a shortened url
    And visit the shortened url
    Then I should be redirected to the original url

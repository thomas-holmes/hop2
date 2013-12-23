Feature: When shortening a URL I should be presented with a
  private management page that allows management features for
  a given short URL.


  Scenario: Shortening a URL should take me to a private management page
    When I create a shortened url
    Then I should be redirected to a private management page

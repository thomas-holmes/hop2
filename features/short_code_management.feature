Feature: When shortening a URL I should be presented with a
  private management page that allows management features for
  a given short URL.


  Scenario: Shortening a URL should take me to a private management page
    When I create a shortened url
    Then I should be redirected to a private management page

  Scenario: The management page should allow me to disable a short code
    When I am viewing the private management page for a short code
    And I disable the short code
    And visit the shortened url
    Then I should be redirected to a 404

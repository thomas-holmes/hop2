Feature: When generating a short url for a given url the same
  short code is generated each time

  Scenario: Generating short url twice results in the same short url
    Given a shortened url for a site exists
    And create another shortened url for the same url
    Then both shortened urls should match

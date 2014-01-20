Feature: Users can make an account to manage their shortened urls

  Scenario: The user should be able to register an account
    When I visit the homepage
    Then I should be able to create a new a new account

  Scenario: The user should be able to login to an existing account
    When I visit the homepage
    And have an existing account
    Then I should be able to login to an existing account

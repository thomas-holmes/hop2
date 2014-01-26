Feature: Users can make an account to manage their shortened urls

  Scenario: The user should be able to register an account
    When I visit the homepage
    Then I should be able to create a new a new account

  Scenario: When I register an account I should be presented with my user page
    When I register a new account
    Then I should be redirected to my user page

  Scenario: The user should be able to login to an existing account
    When I visit the homepage
    And have an existing account
    Then I should be able to login to an existing account

  Scenario: When logged in the Sign in/Sign up links should be replaced with a
    Sign out link and link to my profile
    Given I am a signed in user
    When I visit the homepage
    Then there should be a sign out link
      And a link to my profile
      But no sign in link or sign up link

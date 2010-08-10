Feature: Static Pages
  In order to see content
  A user
  Should be able to see static pages we create

    Scenario: User goes to website root
      When I go to the home page
      Then I should see "Welcome"
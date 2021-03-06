Feature: Create event page
  In order to setup a new event page
  A user
  Should be able to sign in and create a new event page in an existing event

  Scenario: User creates welcome page successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Page"
    Then I fill in "Title" with "Welcome"
    And I press "Save"
    Then I should see "Successfully created event page."
    And I should see "Welcome"
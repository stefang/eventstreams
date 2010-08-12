Feature: Create event track
  In order to setup a new event track
  A user
  Should be able to sign in and create a new event tracks in an existing event

  Scenario: User creates initial track successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my profile page
    Then I should see "myevent"
    And I follow "Content Admin"
    And I follow "Event Tracks"
    And I follow "New Track"
    Then I fill in "Title" with "My Track"
    And I press "Save Changes"
    Then I should see "Successfully created track."
    And I should see "My Track"
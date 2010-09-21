Feature: Create event track
  In order to setup a new event track
  A user
  Should be able to sign in and create a new event tracks in an existing event

  Scenario: User creates initial track successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Event Tracks"
    And I follow "New Track"
    Then I fill in "Title" with "My Track"
    And I check "Published"
    And I press "Save"
    Then I should see "Successfully created track."
    And I should see "My Track"

  Scenario: User views initial published track
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Event Tracks"
    And I should see "mytrack"
    
  Scenario: User views initial track
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has an unpublished track called "mytrack"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Event Tracks"
    And I should see "mytrack"
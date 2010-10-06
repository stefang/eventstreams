Feature: Create video
  In order to setup a new talk video
  A user
  Should be able to sign in and create a new videos to existing talks

  Scenario: User creates a published video successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "Edit"
    And I follow "New Video"
    Then I fill in "Title" with "Video Name"
    And I fill in "Description" with "My talk was be cool"
    And I check "Published"
    And I press "Save"
    Then I should see "Successfully created video."
    And I should see "Video Name"
    When I go to the myevent subdomain
    And I go to the programme page
    And I follow "mytalk"
    Then I should see "Video Name"

  Scenario: User creates a hidden video successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "Edit"
    And I follow "New Video"
    Then I fill in "Title" with "Video Name"
    And I fill in "Description" with "My talk was be cool"
    And I press "Save"
    Then I should see "Successfully created video."
    And I should see "Video Name"
    When I go to the myevent subdomain
    And I go to the programme page
    And I follow "mytalk"
    Then I should not see "Video Name"

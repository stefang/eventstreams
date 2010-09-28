Feature: Create talk
  In order to setup a new talk
  A user
  Should be able to sign in and create a new talks in an existing event

  Scenario: User creates a published talk successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a venue called "posh_hotel"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I select "posh_hotel" from "Venue"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    When I go to the myevent subdomain
    And I follow "Programme"
    Then I should see "My Talk"

  Scenario: User creates an unpublished talk successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" has a programme menu item
    When I go to the events page
    And I follow "Manage"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Show"
    And I select "mytrack" from "Track"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    And I follow "New Talk"
    Then I fill in "Title" with "My Other Talk"
    And I fill in "Description" with "My talk will be cool"
    And I select "mytrack" from "Track"
    And I press "Save"
    Then I should see "Successfully created talk."
    And I should see "My Other Talk"
    When I go to the myevent subdomain
    And I follow "Programme"
    Then I should not see "My Other Talk"

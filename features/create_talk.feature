Feature: Create talk
  In order to setup a new talk
  A user
  Should be able to sign in and create a new talks in an existing event

  Scenario: User creates a published talk successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    When I go to the events page
    And I follow "Content Admin"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I check "Published"
    And I select "mytrack" from "Track"
    And I press "Save Changes"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    When I go to the myevent subdomain
    And I follow "All Talks"
    Then I should see "My Talk"

  Scenario: User creates an unpublished talk successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    When I go to the events page
    And I follow "Content Admin"
    And I follow "Talks"
    And I follow "New Talk"
    Then I fill in "Title" with "My Talk"
    And I fill in "Description" with "My talk will be cool"
    And I select "mytrack" from "Track"
    And I press "Save Changes"
    Then I should see "Successfully created talk."
    And I should see "My Talk"
    When I go to the myevent subdomain
    And I follow "All Talks"
    Then I should not see "My Talk"

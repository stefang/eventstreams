Feature: Create event
  In order to setup a new event
  A user
  Should be able to sign in and create a new event

  Scenario: User creates and publishes an event successfully
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I check "Published"
    And I press "Save Changes"
    Then I should see "Successfully created event"
    And I should be on the user page
    Then I should see "My Event"

  Scenario: User creates and hides an event successfully
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save Changes"
    Then I should see "Successfully created event"
    Then I should see "My Event"

  Scenario: User creates event unsuccessfully
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with ""
    And I fill in "Subdomain" with ""
    And I press "Save Changes"
    Then I should see "2 errors prohibited this event from being saved"

  Scenario: User tries to create an event with a subdomain that already exists
    Given that I am a user
    And an event exists called "myevent"
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save Changes"
    Then I should see "1 error prohibited this event from being saved"
  
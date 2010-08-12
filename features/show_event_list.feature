Feature: List all events
  In order to see all events
  A user
  Should be able to see all listed regardless of signed in state

  Scenario: User looks at event list
     Given that I am a user
     And an event exists called "Event One"
     And an event exists called "Event Two"
     When I go to the events page
     Then I should see "Event One"
     And I should see "Event Two"

  Scenario: Guest looks at event list
    Given an event exists called "Event One"
    And an event exists called "Event Two"
    When I go to the events page
    Then I should see "Event One"
    And I should see "Event Two"

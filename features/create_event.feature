Feature: Create event
  In order to setup a new event
  A user
  Should be able to sign in and create a new event
  
  Scenario: User creates event successfully
     Given that I am a user
     When I follow "New Event"
     Then I should see "Add a new event"
     When I fill in "Title" with "My Event"
     And I fill in "Year" with "2010"
     And I press "Save Changes"
     Then I should see "Successfully created event"
     And I should be on the event page

  Scenario: User creates event unsuccessfully
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with ""
    And I fill in "Year" with "2010"
    And I press "Save Changes"
    Then I should see "prohibited this event from being saved"
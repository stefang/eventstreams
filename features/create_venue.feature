Feature: Create event venue
  In order to setup a new event venue
  A user
  Should be able to sign in and create a new event venue in an existing event

  Scenario: User creates initial venue successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Content Admin"
    And I follow "Venues"
    And I follow "New Venue"
    Then I fill in "Name" with "Nice Hotel"
    And I fill in "Postcode" with "W1K 1BE"
    And I check "Published"
    And I press "Save Changes"
    Then I should see "Successfully created venue."
    
  Scenario: User creates initial venue unsuccessfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Content Admin"
    And I follow "Venues"
    And I follow "New Venue"
    Then I fill in "Name" with ""
    And I check "Published"
    And I press "Save Changes"
    Then I should see "2 errors prohibited this venue from being saved"
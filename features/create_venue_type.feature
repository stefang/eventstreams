Feature: Create venue type
  In order to setup a new venue type
  A user
  Should be able to sign in and create a new venue type to select when adding new venues

  Scenario: User creates initial event type successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    And I follow "Content Admin"
    And I follow "Venue Types"
    And I follow "New Venue Type"
    Then I fill in "Name" with "My Venue Type"
    And I press "Save Changes"
    Then I should see "Successfully created venue type."
    And I should see "My Venue Type"
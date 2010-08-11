Feature: Create event page
  In order to setup a new event page
  A user
  Should be able to sign in and create a new event page in an existing event

  Scenario: User creates event and welcome page successfully
     Given that I am a user
     When I follow "New Event"
     Then I should see "Add a new event"
     When I fill in "Title" with "My Event"
     And I fill in "Subdomain" with "my_event"
     And I press "Save Changes"
     Then I should see "Successfully created event"
     And I should be on the user page
     Then I should see "My Event"
     And I follow "Content Admin"
     And I follow "Manage Event Pages"
     And I follow "New Event Page"
     Then I fill in "Title" with "Welcome"
     And I press "Save Changes"
     Then I should see "Successfully created event page."
     And I should see "Welcome"
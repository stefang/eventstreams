Feature: Create event
  In order to setup a new event
  A user
  Should be able to sign in and create a new event

  Scenario: User creates and publishes an event successfully
    Given that I am a user
    When I follow "Your Events"
    Then I follow "New Event"
    Then I should see "Title"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I check "Published"
    And I press "Save"
    Then I should see "Successfully created event"
    And I should be on the user events page
    Then I should see "My Event"

  Scenario: User creates and hides an event successfully
    Given that I am a user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save"
    Then I should see "Successfully created event"
    Then I should see "My Event"

  Scenario: User creates event unsuccessfully
    Given that I am a user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with ""
    And I fill in "Subdomain" with ""
    And I fill in "Hashtag" with "hellothere"
    And I press "Save"
    Then I should see "4 errors prohibited this event from being saved"

  Scenario: User tries to create an event with a subdomain that already exists
    Given that I am a user
    And an event exists called "myevent"
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "myevent"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"

  Scenario: User tries to create an event with a subdomain with non alphanumeric characters
    Given that I am a user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "@./"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    
  Scenario: User tries to create an event with a subdomain that is reserved
    Given that I am a user
    When I follow "Your Events"
    Then I follow "New Event"
    When I fill in "Title" with "Exciting Event"
    And I fill in "Subdomain" with "www"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "about"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "contact"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "faq"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "blog"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "tour"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "features"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "packages"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "tos"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "privacy"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "help"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "support"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "pricing"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"
    And I fill in "Subdomain" with "careers"
    And I press "Save"
    Then I should see "1 error prohibited this event from being saved"

  
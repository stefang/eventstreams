Feature: View event
  In order to see the event
  A user
  Should be able to visit the event subdomain

  Scenario: Guest looks at a published event
    Given an event exists called "myevent"
    When I go to the myevent subdomain
    And I should see "myevent" within "#event_logo"

  Scenario: Guest looks at a hidden event
    Given a hidden event exists called "myevent"
    When I go to the myevent subdomain
    And I should not see "myevent"

  Scenario: User looks at published event
    Given that I am a user
    And an event exists called "myevent"
    When I go to the myevent subdomain
    Then I should see "myevent" within "#event_logo"

  Scenario: Owner looks at their own published event
    Given that I am a user
    And I have an event called "myevent"
    And I go to my user events page
    Then I should see "myevent"
    When I follow "http://myevent.example.com"
    Then I should see "myevent" within "#event_logo"
    And I should see "Your Account" within "nav#event_admin_bar"
    And I should see "Sign out" within "nav#event_admin_bar"
    And I should see "#myevent" within "a.hashtag"

  Scenario: Owner looks at their own hidden event
    Given that I am a user
    And I have a hidden event called "myevent"
    And I go to my user events page
    Then I should see "myevent"
    When I go to the myevent subdomain
    Then I should see "myevent" within "#event_logo"

  Scenario: Owner looks at their own event and misses out the hashtag
    Given that I am a user
    And I go to my user events page
    When I follow "New Event"
    Then I should see "Title"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created event"
    And I should be on my user events page
    And I should see "My Event"
    Then I follow "http://myevent.example.com"
    Then I should see "My Event" within "#event_logo"
    And I should see "Your Account" within "nav#event_admin_bar"
    And I should see "Sign out" within "nav#event_admin_bar"
    And "a.hashtag" should not exist
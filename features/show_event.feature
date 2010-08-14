Feature: View event
  In order to see the event
  A user
  Should be able to visit the event subdomain

  Scenario: Guest looks at event
    Given an event exists called "myevent"
    When I go to the myevent subdomain
    And I should see "myevent" within "h3"

  Scenario: Guest looks at a published event
    Given an event exists called "myevent"
    When I go to the myevent subdomain
    And I should see "myevent" within "h3"

  Scenario: Guest looks at a hidden event
    Given a hidden event exists called "myevent"
    When I go to the myevent subdomain
    And I should not see "myevent"

  Scenario: User looks at published event
    Given that I am a user
    And an event exists called "myevent"
    When I go to the myevent subdomain
    And I should see "myevent" within "h3"
      
  # Scenario: Owner looks at their own hidden event
  #   Given that I am a user
  #   When I follow "New Event"
  #   Then I should see "Add a new event"
  #   When I fill in "Title" with "My Event"
  #   And I fill in "Subdomain" with "myevent"
  #   And I check "Published"
  #   And I fill in "Hashtag" with "#myevent"
  #   And I press "Save Changes"
  #   Then I should see "Successfully created event"
  #   And I should be on the user page
  #   And I should see "My Event"
  #   Then I follow "Show"
  #   Then I should see "My Event" within "h3"
  #   And I should see "Your Profile" within "nav#event_admin_bar"
  #   And I should see "Sign out" within "nav#event_admin_bar"
  #   And I should see "#myevent" within "a.hashtag"
  #   And I should see "Event Hidden" within "a.hidden"
 
  Scenario: Owner looks at their own published event
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I check "Published"
    And I fill in "Hashtag" with "#myevent"
    And I press "Save Changes"
    Then I should see "Successfully created event"
    And I should be on the user page
    And I should see "My Event"
    Then I follow "Show"
    Then I should see "My Event" within "h3"
    And I should see "Your Profile" within "nav#event_admin_bar"
    And I should see "Sign out" within "nav#event_admin_bar"
    And I should see "#myevent" within "a.hashtag"

  Scenario: Owner looks at their own event and misses out the hashtag
    Given that I am a user
    When I follow "New Event"
    Then I should see "Add a new event"
    When I fill in "Title" with "My Event"
    And I fill in "Subdomain" with "myevent"
    And I check "Published"
    And I press "Save Changes"
    Then I should see "Successfully created event"
    And I should be on the user page
    And I should see "My Event"
    Then I follow "Show"
    Then I should see "My Event" within "h3"
    And I should see "Your Profile" within "nav#event_admin_bar"
    And I should see "Sign out" within "nav#event_admin_bar"
    And "a.hashtag" should not exist
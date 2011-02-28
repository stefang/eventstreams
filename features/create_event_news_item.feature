Feature: Create event news item
  In order to create a new event news item
  A user
  Should be able to sign in and create a new news item in an existing event

  Scenario: User creates published news item successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "News"
    And I follow "New News Item"
    Then I fill in "Headline" with "Latest news headline"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created event news item."
    And I should see "Latest news headline"
    When I go to the myevent subdomain
    Then I should see "Latest news headline"
    
  Scenario: User creates news item successfully with a non default date
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "News"
    And I follow "New News Item"
    Then I fill in "Headline" with "Dated News Headline"
    And I fill in "Item Date" with "01-02-2000"
    And I check "Show"
    And I press "Save"
    Then I should see "Successfully created event news item."
    And I should see "01-02-2000"
    And I should see "Dated News Headline"
    When I go to the myevent subdomain
    Then I should see "Dated News Headline"
    And I should see "1st February 2000"

  Scenario: User creates hidden news item successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "News"
    And I follow "New News Item"
    Then I fill in "Headline" with "Latest news headline"
    And I press "Save"
    Then I should see "Successfully created event news item."
    And I should see "Latest news headline"
    When I go to the myevent subdomain
    Then I should not see "Latest news headline"
    
  Scenario: User creates and deletes news item successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "News"
    And I follow "New News Item"
    Then I fill in "Headline" with "Latest news headline"
    And I press "Save"
    Then I should see "Successfully created event news item."
    And I should see "Latest news headline"
    When I follow "Delete"
    Then I should see "Successfully deleted event news item."
    
   
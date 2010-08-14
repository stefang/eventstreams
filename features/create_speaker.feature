Feature: Create talk
  In order to setup a new talk
  A user
  Should be able to sign in and create a new talks in an existing event
  
  Scenario: User creates a published speaker successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    When I go to the events page
    And I follow "Content Admin"
    And I follow "Talks"
    And I follow "Show"
    And I follow "New Speaker"
    Then I fill in "Name" with "Speaker Name"
    And I fill in "Biog" with "My talk will be cool"
    And I check "Published"
    And I press "Save Changes"
    Then I should see "Successfully created speaker."
    And I should see "Speaker Name"
    When I go to the myevent subdomain
    And I follow "All Talks"
    And I follow "mytalk"
    Then I should see "Speaker Name"
    
  Scenario: User creates a hidden speaker successfully
    Given that I am a user
    And I have an event called "myevent"
    And "myevent" has a published track called "mytrack"
    And "myevent" event "mytrack" track has a published talk called "mytalk"
    When I go to the events page
    And I follow "Content Admin"
    And I follow "Talks"
    And I follow "Show"
    And I follow "New Speaker"
    Then I fill in "Name" with "Speaker Name"
    And I fill in "Biog" with "My talk will be cool"
    And I press "Save Changes"
    Then I should see "Successfully created speaker."
    And I should see "Speaker Name"
    When I go to the myevent subdomain
    And I follow "All Talks"
    And I follow "mytalk"
    Then I should not see "Speaker Name"
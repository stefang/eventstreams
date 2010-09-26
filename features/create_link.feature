Feature: Create link
  In order to setup a new menu link to external site
  A user
  Should be able to sign in and create a new link to an external website

  Scenario: User creates blog link successfully
    Given that I am a user
    And I have an event called "myevent"
    When I go to my user events page
    Then I should see "myevent"
    And I follow "Manage"
    And I follow "Pages & Links"
    And I follow "New Link"
    Then I fill in "Title" with "Blog"
    And I fill in "Url" with "http://test.com"
    And I press "Save"
    Then I should see "Successfully created link."
    And I should see "Blog"
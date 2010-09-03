Feature: Sign up
  In order to get access to protected sections of the site
  A user
  Should be able to sign up

  Scenario: User signs up with invalid data
    When I go to the sign up page
    Then I should see "Sorry, you need an invite to sign up"
    # And I fill in "Email" with "invalidemail"
    # And I fill in "Password" with "password"
    # And I fill in "Confirm password" with ""
    # And I press "Sign Up"
    # Then I should see error messages
    
  Scenario: User signs up with valid data but no invite code
    When I go to the sign up page
    Then I should see "Sorry, you need an invite to sign up"
    # And I fill in "First name" with "Frodo"
    # And I fill in "Last name" with "Baggins"
    # And I fill in "Email" with "email@person.com"
    # And I fill in "Password" with "password"
    # And I fill in "Confirm password" with "password"
    # And I press "Sign Up"
    # Then I should see "Sorry, you need an invite to sign up"
    
  Scenario: User confirms his account
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "Confirmed email and signed in"
    And I should be signed in      
    
    
    

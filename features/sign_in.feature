Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in
  
    Scenario: User is not signed up
      Given no user exists with an email of "mickey.mouse@disney.com"
      When I go to the sign in page
      And I sign in as "mickey.mouse@disney.com/password"
      Then I should see a flash failure containing "Bad email or password."
      And I should be signed out

    Scenario: User is not confirmed
      Given I signed up with "donald.duck@disney.com/password"
      When I go to the sign in page
      And I sign in as "donald.duck@disney.com/password"
      Then I should see a flash notice containing "User has not confirmed email. Confirmation email will be resent."
      And I should be signed out
   
   Scenario: User enters wrong password
      Given I am signed up and confirmed as "scooby.doo@disney.com/password"
      When I go to the sign in page
      And I sign in as "scooby.doo@disney.com/shaggy"
      Then I should see a flash failure containing "Bad email or password."
      And I should be signed out
   
   Scenario: User signs in successfully
      Given I am signed up and confirmed as "donald.duck@disney.com/password"
      When I go to the sign in page
      And I sign in as "donald.duck@disney.com/password"
      And I should be signed in
   
   Scenario: User signs in and checks "remember me"
      Given I am signed up and confirmed as "donald.duck@disney.com/password"
      When I go to the sign in page
      And I sign in with "remember me" as "donald.duck@disney.com/password"
      And I should be signed in
      When I return next time
      Then I should be signed in
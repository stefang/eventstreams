Feature: Password reset
  In order to sign in even if user forgot their password
  A user
  Should be able to reset it
    Scenario: User is not signed up
      Given no user exists with an email of "email@person.com"
      When I request password reset link to be sent to "email@person.com"
      Then I should see "Unknown email"

    Scenario: User is signed up and requests password reset
      Given I signed up with "donald.duck@disney.com/password"
      When I request password reset link to be sent to "donald.duck@disney.com"
      Then I should see "instructions for changing your password"
      And a password reset message should be sent to "donald.duck@disney.com"

    Scenario: User is signed up updated his password and types wrong confirmation
      Given I signed up with "donald.duck@disney.com/password"
      When I follow the password reset link sent to "donald.duck@disney.com"
      And I update my password with "newpassword/wrongconfirmation"
      Then I should see error messages
      And I should be signed out

    Scenario: User is signed up and updates his password
      Given I signed up with "donald.duck@disney.com/password"
      And I follow the password reset link sent to "donald.duck@disney.com"
      And I update my password with "newpassword/newpassword"
      Then I should be signed in
      When I sign in as "donald.duck@disney.com/newpassword"
      Then I should be signed in
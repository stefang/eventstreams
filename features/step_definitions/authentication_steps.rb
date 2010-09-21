Given /^that I am a user$/ do
  Given %{I am signed up and confirmed as "user@example.com/password"}
  When %{I go to the sign in page}
  And %{I sign in as "user@example.com/password"}
end

Given /^that I am a guest$/ do
end
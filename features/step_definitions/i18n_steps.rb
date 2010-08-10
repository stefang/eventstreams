Then /^I should see the translation "(.*)"/ do |message|
  assert_match I18n.t(message), @response.body
end
Then /^I should see a flash notice containing "(.*)"/ do |message| 
  assert_select ".flash_notice", message
end

Then /^I should see a flash success containing "(.*)"/ do |message| 
  puts response.body
  assert_select ".flash_success", message
end

Then /^I should see a flash error containing "(.*)"/ do |message|
  assert_select ".flash_error", /#{message}/
end

Then /^I should see a flash failure containing "(.*)"/ do |message|
  assert_select ".flash_failure", /#{message}/
end

Then /^I should see a flash containing "(.*)"/ do |message|
  assert_select "#flash .inner div", /#{message}/
end


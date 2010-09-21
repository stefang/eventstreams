Given /^an event exists called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name
end

Given /^a hidden event exists called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name, :published => false
end

Given /^I have an event called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name, :user_id => @user.id, :hashtag => "##{event_name}"
end

Given /^I have a hidden event called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name, :published => false, :user_id => @user.id, :hashtag => "##{event_name}"
end
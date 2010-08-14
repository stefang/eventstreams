Given /^an event exists called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name
end

Given /^I have an event called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name, :subdomain => event_name, :user_id => @user.id
end
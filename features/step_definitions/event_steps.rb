Given /^an event exists called "(.*)"$/ do |event_name|
  event = Factory :event, :title => event_name
end

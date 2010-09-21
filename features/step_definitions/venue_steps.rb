Given /^"(.*)" has a venue called "(.*)"$/ do |event, name|
  track = Factory :venue, :name => name, :event_id => Event.find_by_title(event).id
end
Given /^"(.*)" has a venue type called "(.*)"$/ do |event, name|
  track = Factory :venue_type, :name => name, :event_id => Event.find_by_title(event).id
end
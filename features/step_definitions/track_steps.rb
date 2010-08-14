Given /^"(.*)" has a track called "(.*)"$/ do |event, track_name|
  track = Factory :track, :title => track_name, :event_id => Event.find_by_title(event).id
end
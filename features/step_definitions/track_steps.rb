Given /^"(.*)" has a published track called "(.*)"$/ do |event, track_name|
  track = Factory :track, :title => track_name, :event_id => Event.find_by_title(event).id
end

Given /^"(.*)" has an unpublished track called "(.*)"$/ do |event, track_name|
  track = Factory :track, :title => track_name, :event_id => Event.find_by_title(event).id, :published => false
end
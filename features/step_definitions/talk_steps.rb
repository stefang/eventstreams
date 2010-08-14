Given /^"(.*)" event "(.*)" track has a published talk called "(.*)"$/ do |event, track, talk_name|
  talk = Factory :talk, :title => talk_name, :track_id => Track.find_by_title(track).id, :event_id => Event.find_by_title(event).id
end

Given /^"(.*)" event "(.*)" track has an unpublished talk called "(.*)"$/ do |event, track, talk_name|
  talk = Factory :talk, :title => talk_name, :track_id => Track.find_by_title(track).id, :event_id => Event.find_by_title(event).id, :published => false
end
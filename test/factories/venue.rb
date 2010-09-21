Factory.sequence :venue_name do |n|
  "venue#{n}"
end

Factory.define :venue do |venue|
  venue.name                 { Factory.next :venue_name }
  venue.event_id             { 1 }
  venue.postcode             { "W1K 1BE" }
  
end
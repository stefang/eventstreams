Factory.sequence :venue_type_name do |n|
  "venue_type#{n}"
end

Factory.define :venue_type do |venue_type|
  venue_type.name                 { Factory.next :venue_type_name }
end
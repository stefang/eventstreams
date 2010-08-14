Factory.sequence :event_title do |n|
  "event#{n}"
end

Factory.sequence :event_subdomain do |n|
  "event#{n}"
end

Factory.define :event do |event|
  event.title                 { Factory.next :event_title }
  event.subdomain             { Factory.next :event_subdomain }
  event.start_date            { "2010-04-01" }
  event.end_date              { "2010-04-04" }
  event.published             { true }
end
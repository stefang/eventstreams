Factory.sequence :event_title do |n|
  "event#{n}"
end

Factory.define :event do |event|
  event.title                 { Factory.next :event_title }
  event.subdomain             { :event_title }
  event.start_date            { "2010-04-01" }
  event.end_date              { "2010-04-04" }
end
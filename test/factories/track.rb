Factory.sequence :track_title do |n|
  "event#{n}"
end

Factory.define :track do |track|
  track.title                 { Factory.next :track_title }
  track.description           { "Very interesting track" }
  track.published             { true }
end
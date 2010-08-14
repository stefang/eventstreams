Factory.sequence :talk_title do |n|
  "talk#{n}"
end

Factory.define :talk do |talk|
  talk.title                 { Factory.next :talk_title }
  talk.description           { "Very interesting talk" }
  talk.published             { true }
end
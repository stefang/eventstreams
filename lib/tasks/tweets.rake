namespace :tweets do
  desc "Will update all event tweets"  
  task "update" => :environment do
    events = Event.all
    events.each do |e|
      pull_tweets e
    end
  end
  desc "Will delete all tweets"
  task "clear" => :environment do
    Tweet.delete_all
  end
end

def process_tweet(tweet, event, tweet_type)
  t = Tweet.find_by_twitter_id tweet.id
  unless t
    nt = Tweet.new
    nt.text = tweet.text
    nt.twitter_id = tweet.id
    nt.event_id = event.id
    nt.avatar = tweet.profile_image_url
    nt.twitter_user_id = tweet.from_user_id
    nt.created_at = tweet.created_at
    nt.tweet_type = tweet_type
    nt.save
  else
    return t
  end
 end

 def pull_tweets(event)
   unless event.hashtag.blank?
     since_id = Tweet.maximum(:twitter_id, :conditions => "event_id = #{event.id} AND tweet_type = 'hashtag'")
     puts "Pulling Tweets For " + event.title
     results = []
     max_id = nil
     page = 1
     batch = nil
     begin
       batch = Twitter::Search.new(event.hashtag).since(since_id).per_page(100).page(page).max(max_id).fetch()
       max_id = batch.max_id if max_id.nil?
       results.concat batch.results
       page += 1
     end while batch.key?("next_page")
     results.reverse.each {|tweet|
       process_tweet tweet, event, "hashtag"
     }
     puts "Pulled Hashtag Tweets For " + event.title
   end
   unless event.twitter_account.blank?
     since_id = Tweet.maximum(:twitter_id, :conditions => "event_id = #{event.id} AND tweet_type = 'account'")
     puts "Pulling Tweets For " + event.title
     results = []
     max_id = nil
     page = 1
     batch = nil
     begin
       puts "Twitter::Search.new.from(#{event.twitter_account[1..-1]}).since(#{since_id}).per_page(#{100}).page(#{page}).max(#{max_id}).fetch()"
       batch = Twitter::Search.new(event.twitter_account[1..-1]).since(since_id).per_page(100).page(page).max(max_id).fetch()
       max_id = batch.max_id if max_id.nil?
       results.concat batch.results
       page += 1
     end while batch.key?("next_page")
     results.reverse.each {|tweet|
       process_tweet tweet, event, "account"
     }
     puts "Pulled Account Tweets For " + event.title
   end


 end
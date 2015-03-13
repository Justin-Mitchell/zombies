require 'test_helper'

class TweetPageTest < ActionDispatch::IntegrationTest
    test "Should go to tweet page from index page" do
       tweet = FactoryGirl.create(:tweet)
       visit tweets_url
       click_link tweet.status
       assert_equal tweet_path(tweet), current_path
    end
    
    test "tweet page has zombie link" do
       tweet = FactoryGirl.create(:tweet)
       visit tweets_url
       click_link tweet.status 
       within('h3') do
          assert has_content?(tweet.zombie.name) 
       end
    end
end

require 'test_helper'

class TweetDisplaysStatusTestTest < ActionDispatch::IntegrationTest
    def setup
        @tweet = tweets(:ash_1)
    end
    
    test "tweet page responds successfully" do
        get tweet_url(@tweet.id)
        assert_response :success
    end
    
    test "tweet displays status in heading" do
        get tweet_url(@tweet.id)
        assert_select "h1", @tweet.status
    end
    
    test "Capybara: Tweet displays status in heading" do
       visit tweet_url(@tweet)
       
       within('h1') do
          assert has_content?(@tweet.status) 
       end 
    end
end

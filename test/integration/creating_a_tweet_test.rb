require 'test_helper'

class CreatingATweetTest < ActionDispatch::IntegrationTest
    def setup
       @zombie = zombies(:ash)
       @tweet_attributes = {tweet: {zombie_id: @zombie.id, status: 'test tweet'}} 
    end
    
    test 'Should go to new tweet page' do
       visit root_url
       click_link "New Tweet"
       assert_equal new_tweet_path, current_path 
    end

    test "Should create a new tweet" do
        create_tweet_for('Ash', 'I love the way your brain feels')
        assert_equal tweet_path(Tweet.last), current_path
    end
    
    test "Responds with a redirect to the tweet page" do
       post tweets_url, @tweet_attributes
       assert_redirected_to tweet_path(Tweet.last) 
    end
end

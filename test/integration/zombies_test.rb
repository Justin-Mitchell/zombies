require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
    def setup
        @zombie = FactoryGirl.create(:zombie) 
    end
    
    test "Anyone can view zombie information" do
        visit zombie_url(@zombie)
     
        assert_equal zombie_path(@zombie), current_path
        within("h1") do
            assert has_content?(@zombie.name) 
        end
    end
  
    test "Navigation is available to the zombie page" do
        tweet = FactoryGirl.create(:tweet)
        zombie = tweet.zombie
        visit root_url 
        within("#tweet_#{tweet.id}") do
            click_link zombie.name
            assert_equal zombie_path(zombie), current_path 
        end
    end
end
require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  should validate_length_of(:status).is_at_least(3).is_at_most(140)
  
  def setup
      @tweet = tweets(:ash_1)
      @zombie = zombies(:ash)
  end
  
  test "invalid without a status" do
     tweet = Tweet.new
     assert !tweet.valid?, "Tweet not being validated" 
  end
  
  test "valid with all attributes" do
     zombie = Zombie.new
     tweet = Tweet.new
     tweet.zombie = zombie
     tweet.status = "I want to eat your brains. <3"
     assert tweet.valid?, "Tweet was not valid" 
  end
  
  test "can detect brains" do
     @tweet.status = "I love <3 brains"
     assert @tweet.brains?, "Tweet did not include brains" 
  end
  
  test "contains a zombie" do
     assert @tweet.zombie == @zombie, "Tweet missing zombie" 
  end
  
  test "show_author_summary should set status to zombie summary" do
     @tweet.show_author_summary
  end
end

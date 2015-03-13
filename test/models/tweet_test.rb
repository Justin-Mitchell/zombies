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
     @tweet.zombie.stubs(:zombie_summary)
     @tweet.show_author_summary
     assert_equal @tweet.zombie.zombie_summary, @tweet.status, 'tweet status does not contain zombie summary' 
  end
  
  test "show_author_summary should call zombie_summary" do
     @tweet.zombie.expects(:zombie_summary)
     @tweet.show_author_summary
  end
  
  test "status_image calls the ZwitPic get_status_image api" do
     ZwitPic.stubs(:get_status_image).with(@tweet.id).returns(name: 'Hello brains', url: 'http://zwitpic.com/2.jpg')
     assert_equal "<img src='http://zwitpic.com/2.jpg' alt='Hello brains'/>", @tweet.status_image
  end
end

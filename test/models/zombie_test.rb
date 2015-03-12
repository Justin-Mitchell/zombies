require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
    should validate_presence_of(:name)
    should validate_presence_of(:graveyard)
    should validate_length_of(:name).is_at_most(15)
    should have_many(:tweets)
  
  def setup
     @z = zombies(:ash) 
  end
  
  test "valid with all attributes" do 
      @z.name = 'Ash'
      @z.graveyard = 'Oak Park'
      assert @z.valid?, 'Zombie was not valid'
  end
  
  test "invalid name gives error message" do
     @z.name = nil
     @z.valid?
     assert_presence(@z, :name)
  end
  
  test "can generate avatar_url" do
     assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url 
  end
  
  test "should respond to tweets" do
     assert_respond_to @z, :tweets, "Zombie does not have tweets relationship"
  end
  
  test "should contain only tweets that belong to zombie" do
     assert @z.tweets.all? {|t| t.zombie == @z}
  end
end

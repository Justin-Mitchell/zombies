require 'test_helper'
require "mocha/test_unit"

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
  
  test "decapitate should set status to dead again" do
     @z.weapon.stubs(:slice)
     @z.decapitate
     assert "dead again", @z.status 
  end
  
  test "decapitate should call slice" do
     @z.weapon.expects(:slice) 
     @z.decapitate
  end
  
  test "geolocate calls the Zoogle graveyard locator" do
     Zoogle.expects(:graveyard_locator).with(@z.graveyard).returns({latitude: 3, longitude: 2})
     @z.geolocate 
  end
  
  test "geolocate returns properly formatted lat, long" do
     Zoogle.stubs(:graveyard_locator).with(@z.graveyard).returns({latitude: 3, longitude: 2})
     assert_equal "3, 2", @z.geolocate 
  end
  
  # test "geolocate_with_object properly formatted lat, long" do
  #    loc = stub(:latitude => 0, :longitude => 0)
  #    Zoogle.stubs(:graveyard_locator).returns(loc)
  #    assert_equal "2, 3", @z.geolocate_with_object 
  # end
end

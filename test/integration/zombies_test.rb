require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Anyone can view zombie information" do
     zombie = zombies(:ash)
     visit zombie_url(zombie)
     
     assert_equal zombie_path(zombie), current_path
     within("h1") do
        assert has_content?(zombie.name) 
     end
  end
  
  test "Navigation is available to the zombie page" do
     zombie = zombies(:ash)
     tweet = tweets(:ash_1)
     visit root_url 
  end
  
end

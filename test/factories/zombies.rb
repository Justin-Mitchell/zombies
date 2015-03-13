FactoryGirl.define do
   factory :zombie do
      sequence(:name) {|i| "Ash#{i}" }
      graveyard "Oak Park"
      status "EATING BRAINS"
      
      factory :armed_zombie do
         association :weapon, factory: :hatchet
         status "READY TO GET BRAINS" 
         graveyard 'South'
      end
      
      factory :zombie_with_tweet do
         association :tweets
         status "I TWEET" 
      end
   end    
end
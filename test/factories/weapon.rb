FactoryGirl.define do
   factory :weapon do
      name 'Broadsword'
      association :zombie
      
      factory :hatchet do
         name 'Hatchet' 
      end
   end
end
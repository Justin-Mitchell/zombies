FactoryGirl.define do
    factory :tweet do
       sequence(:status) {|i| "Lurking 4 BRAIINNSS#{i}"}
       association :zombie
    end 
end
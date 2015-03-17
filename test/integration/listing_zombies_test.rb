require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  
    setup { host! 'api.zombies.com' }
    
    test 'returns zombies in JSON' do
        get "/zombies", {}, {'Accept' => Mime::JSON}
        assert_equal 200, response.status
        assert_equal Mime::JSON, response.content_type
    end
    
    test 'returns zombies in XML' do
        get "/zombies", {}, {'Accept' => Mime::XML}
        assert_equal 200, response.status
        assert_equal Mime::XML, response.content_type
    end
    
    test 'returns list of all zombies' do
        get '/zombies', {}, {'Accept' => Mime::JSON}
        assert_equal 200, response.status
        refute_empty response.body
    end
    
    test 'returns zombies filtered by graveyard' do
       john = Zombie.create!(name: 'John', graveyard: "South")
       joanna = Zombie.create!(name: 'Joanna', graveyard: 'Vim Memorial') 
       
       get "/zombies?graveyard=South", {}, {'Accept' => Mime::JSON}
       assert_equal 200, response.status
       
       zombies = JSON.parse(response.body, symbolize_names: true)
       names = zombies.collect { |z| z[:name] }
       assert_includes names, 'John'
       refute_includes names, 'Joanna'
    end
    
    test 'returns zombie by id' do
       zombie = Zombie.create!(name: 'Joanna', graveyard: 'Vim Memorial')
       get "/zombies/#{zombie.id}", {}, {'Accept' => Mime::JSON}
       assert_equal 200, response.status
       
       zombie_response = json(response.body)
       assert_equal zombie.name, zombie_response[:name] 
    end
end

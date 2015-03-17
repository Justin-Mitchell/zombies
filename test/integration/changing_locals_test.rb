require 'test_helper'

class ChangingLocalsTest < ActionDispatch::IntegrationTest
    
    setup { host! 'api.zombies.com' }

    test 'returns list of zombies in english' do
       get '/zombies', {}, { "Accept-Language" => 'en', 'Accept' => Mime::JSON }
       assert_equal 200, response.status
       zombies = json(response.body)
       assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message] 
    end
    
    test 'returns list of zombies in portuguese' do
        get '/zombies', {}, { "Accept-Language" => 'pt-BR', 'Accept' => Mime::JSON }
        assert_equal 200, response.status
        zombies = json(response.body)
        assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message] 
    end
end

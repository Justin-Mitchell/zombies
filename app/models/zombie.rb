class Zombie < ActiveRecord::Base
    validates :name, presence: true, length: {within: 1..15}
    validates :graveyard, presence: true
    
    has_many  :tweets
    has_one  :weapon
    
    def avatar_url
       "http://zombitar.com/#{id}.jpg" 
    end
    
    def decapitate
       weapon.slice(self, :head)
       self.status = "dead again" 
    end
    
    def zombie_summary
       "#{name} lives in #{graveyard} and has #{self.tweets.size} tweets" 
    end
    
    def geolocate
       loc = Zoogle.graveyard_locator(self.graveyard)
       "#{loc[:latitude]}, #{loc[:longitude]}" 
    end
    
    def geolocate_with_object
       loc = Zoogle.graveyard_locator(self.graveyard)
       "#{loc.latitude}, #{loc.longitude}" 
    end
end

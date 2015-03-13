class Tweet < ActiveRecord::Base
    belongs_to :zombie
    
    validates :status, presence: true, length: {within: 3..140, allow_blank: true}
    validates :zombie, presence: true
    
    def brains?
       status =~ /(brains|breins)/i 
    end
    
    def show_author_summary
        self.status = self.zombie.zombie_summary
    end
    
    def status_image
       image = ZwitPic.get_status_image(self.id) # This is returning an array 
       "<img src='#{image[:url]}' alt='#{image[:name]}'/>".html_safe
    end
    
    
end

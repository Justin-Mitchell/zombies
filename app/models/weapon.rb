class Weapon < ActiveRecord::Base
    belongs_to  :zombie
    validates   :zombie, presence: true
    
    def slice(*args)
       return nil 
    end
end

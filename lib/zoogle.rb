module Zoogle
    def self.graveyard_locator(graveyard)
       case graveyard
       when "South"
           {:latitude => 3, :longitude => 1}
       when "Oak Park"
           {:latitude => 3, :longitude => 1}
       when "Green Meadows"
           {:latitude => 3, :longitude => 1}
       else
           {:latitude => 0, :longitude => 0}
       end
    end
    
end
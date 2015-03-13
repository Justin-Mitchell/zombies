module Zoogle
    def self.graveyard_locator(graveyard)
       case graveyard
       when "South"
           {:latitude => 2, :longitude => 1}
       when "Oak Park"
           {:latitude => 3, :longitude => 2}
       when "Green Meadows"
           {:latitude => 4, :longitude => 3}
       else
           nil
       end
    end
    
end
module API
    class ZombiesController < ApplicationController
       
        before_filter :set_zombie, :only => [:show]
      
        # http://guides.rubyonrails.org/layouts_and_rendering.html
        def index
            @zombies = Zombie.all
            if graveyard = params[:graveyard]
                @zombies = @zombies.where(:graveyard => graveyard)
            end
          
            respond_to do |format|
                format.json 
                format.xml  { render xml:  @zombies, status: 200 }
            end
        end
      
        def show
            render json: @zombie, status: 200
        end
      
        private
      
        def set_zombie
            @zombie = Zombie.find(params[:id]) 
        end
       
    end 
end
#require_dependency "unirole/unirole_controller"

module Unirole
  class RankController < UniroleController
    def index      
      @rank = Rank.all
    end
    
    def new 
      @rank = Rank.new
    end
    
    def create
      @rank = Rank.new(params[:rank])
      @rank.save
    end  

    def show
    end

    def destroy
    end
  end
end

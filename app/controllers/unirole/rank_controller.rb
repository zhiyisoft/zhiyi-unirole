#require_dependency "unirole/unirole_controller"

module Unirole
  class RankController < UniroleController
    def index
      @rank  = Rank.all
    end
    
    def new 
      @rank = Rank.new
    end
    
    def create
      
    end  

  end
end

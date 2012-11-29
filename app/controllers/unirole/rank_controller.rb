#require_bdependency "unirole/unirole_controller"

module Unirole
  class RankController < UniroleController
    def index      
      @rank = Rank.all
    end
    
    def create
      @rank = Rank.new(params[:rank])
      if @rank.save
        flash[:notice] = "save success!"
        redirect_to  :controller =>"rank",:action=>"index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller =>"rank",:action=>"index"        
      end
    end  
    
    def update
      @rank = Rank.find(params[:id])
      if @rank.update_attribute(params[:key],params[:value])
        render :json=>'{"status":200,"desc":"success"}'
      else
        render :json =>'{"status":500,"desc":"error"}'
      end
    end

    def destroy
      @rank = Rank.find(params[:id])
      if @rank.destroy
        flash[:notice] = "del success!"
      else
        flash[:notice] = "del error!"
      end
      redirect_to :controller =>"rank",:action=>"index"
    end
  end
end

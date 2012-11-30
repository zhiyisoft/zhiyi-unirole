#require_dependency "unirole/unirole_controller"

module Unirole
  class OrgansController < UniroleController
    def index
      @organs = Organ.where(:parent_id=>nil)
    end

    def create
      @organs = Organ.new(params[:organ])
      if @organs.save
        flash[:notice] = "save success!"
        redirect_to  :controller =>"organs",:action=>"index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller =>"organs",:action=>"index"        
      end
    end

    def update

    end

    def get_parent
     @data=[]
     rank = Rank.find(params[:id])
     Rank.all.each do |list|
        if list.seq !=rank.seq
          if !list.member_of? rank  
            Organ.where(:rank_id =>list.id).each do |idx|
              @data << idx
            end
          end
        end
      end
      
      render :json =>@data.to_json
    end
  end
end

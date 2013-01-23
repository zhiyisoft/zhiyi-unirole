#require_dependency "unirole/unirole_controller"

module Unirole
  class OrgansController < UniroleController

    load_and_authorize_resource class: Unirole::Organ 

    def tree
      render json: tree_of.to_json
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

    def get_parent
     @data=[]
     rank = Rank.find(params[:id])
     Rank.all.each do |list|
        if list.seq !=rank.seq
          if !list.member_of? rank              
            Organ.where(:rank_id =>list.id).each do |idx|
              @data <<{:key => idx.id ,:value => idx.full_name}
            end
          end
        end
      end
      
      render :json =>@data.to_json
    end

    private
    def tree_of node=nil
      organs = node.nil? ? Unirole::Organ.roots : node.children
      organs.map {|organ| { label: organ.name }.merge(organ.has_children? ? {children: tree_of(organ)} : {})}
    end
  end
end

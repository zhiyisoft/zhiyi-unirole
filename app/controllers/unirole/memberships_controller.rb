#require_bdependency "unirole/unirole_controller"

module Unirole
  class MembershipsController < UniroleController
    load_and_authorize_resource :class => Unirole::Membership   

    def create      
      @membership = Membership.new(params[:membership])
      if @membership.save
        flash[:notice] = "save success!"
        redirect_to  :controller =>"memberships",:action=>"index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller =>"memberships",:action=>"index"        
      end
    end  
    
    def update
      @membership = Membership.find(params[:id])
      if @membership.update_attribute(params[:key],params[:value])
        render :json=>'{"status":200,"desc":"success"}'
      else
        render :json =>'{"status":500,"desc":"error"}'
      end
    end

    def destroy
      @membership = Membership.find(params[:id])
      if @membership.destroy
        flash[:notice] = "del success!"
      else
        flash[:notice] = "del error!"
      end
      redirect_to :controller =>"memberships",:action=>"index"
    end
  end
end

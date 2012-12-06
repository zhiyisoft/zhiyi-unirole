#require_bdependency "unirole/unirole_controller"

module Unirole
  class UsersController < UniroleController
    def index 
      @users = User.all()
      respond_to do |format|
        format.html {render :layout => (not request.xhr?)}
        format.json {render :json=>@users}
      end
      p @users
    end

    def create
      @users = User.new(params[:users])
      if @users.save
        flash[:notice] = "save success!"
        redirect_to  :controller =>"users",:action=>"index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller =>"users",:action=>"index"        
      end
    end  

    def update
      @user = User.find(params[:id])
      if @user.update_attribute(params[:key],params[:value])
        render :json=>'{"status":200,"desc":"success"}'
      else
        render :json =>'{"status":500,"desc":"error"}'
      end
    end



    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "del success!"
      else
        flash[:notice] = "del error!"
      end
      redirect_to :controller =>"users",:action=>"index"
    end


  end
end

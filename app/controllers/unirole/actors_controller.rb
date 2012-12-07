# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < UniroleController

    def index
      @organs = Organ.where(:parent_id=>nil)
      render :layout => (not request.xhr?)
    end

    def create
      @actor=Actor.new      
      @actor[:membership_id] = params[:membership_id]
      @actor[:organ_id] = params[:organ_id]
      if Actor.where(:membership_id =>@actor[:membership_id], :organ_id=>@actor[:organ_id]).size==0
        if @actor.save 
          @data={:status=>"save success!"}
        else
          @data={:status=>"save error!"}
        end
      else
        @data={:status=>"Data already exists!"}
      end
      respond_to do |format|
        format.html
        format.json {render :json =>@data}
      end
    end

    def destroy
      @actor = Actor.find(params[:id])
      if @actor.destroy
        flash[:notice] = "del success!"
      else
        flash[:notice] = "del error!"
      end
      redirect_to :controller =>"actors",:action=>"index"
    end

#----用户管理---------------------------
    def add_user
      @actor_user = Actor.find(params[:actor_id])
      @users = User.all
      render :layout=>false
    end

    def user_list
      @user_ids = Actor.find(params[:actor_id])
      render :layout=>false
    end

    def add_user_for_actor
      @user_ids = Actor.find(params[:actor_id])      
      if params[:act]=="add"                
        @user_ids.user_ids << params[:user]
        
      else
        @user_ids.user_ids.delete(params[:user])
      end      
      @user_ids.save      
      render :json =>Actor.find(params[:actor_id])      
    end

=begin
    def get_user
      @actor_user = Actor.find(params[:actor_id])
      respond_to do |format|
        format.html
        format.json{render :json => @actor_user.user_ids}
      end
    end
=end



  end
end

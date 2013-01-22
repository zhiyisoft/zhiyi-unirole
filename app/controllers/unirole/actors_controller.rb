# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < UniroleController

    before_filter CASClient::Frameworks::Rails::Filter
    load_and_authorize_resource class: Unirole::Actor

    def index
      @user = Unirole::User.find(params[:user_id])
      @actors = @user.actors
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
      @user = User.find(params[:user]) 
      if params[:act]=="add"                
        @user_ids.user_ids << @user.id  unless @user_ids.user_ids.include?(@user.id)
      else       
       @user_ids.user_ids.delete(@user.id)
      end      

      @user_ids.save
      render :json =>Actor.find(params[:actor_id])      
    end

  end
end

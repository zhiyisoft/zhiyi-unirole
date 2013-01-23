# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < UniroleController

    before_filter CASClient::Frameworks::Rails::Filter
    load_and_authorize_resource class: Unirole::Actor

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
  end
end

# -*- coding: utf-8 -*-
#require_dependency "unirole/unirole_controller"

module Unirole
  class ActorController < UniroleController

    def index
      @organs = Organ.where(:parent_id=>nil)
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
        @data={:status=>"数据已经存在，无须重复保存!"}
      end
      respond_to do |format|
        format.html
        format.json {render :json =>@data}
      end
    end
  end
end

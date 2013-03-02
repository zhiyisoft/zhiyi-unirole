module Unirole
  class OrgansController < ApplicationController
    include Apotomo::Rails::ControllerMethods
    load_and_authorize_resource :class => Unirole::Organ
    respond_to :html, :json, :js

    has_widgets do |root|
      root << widget('organ', :organ)
    end

    def index
      if params[:tree] then
        render json: tree_of.to_json
      else
        respond_with @organs
      end
    end

    def create
      @organs = Organ.new(params[:organ])
      if @organs.save
        flash[:notice] = "save success!"
        redirect_to  :controller => "organs", :action => "index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller => "organs", :action => "index"
      end
    end

    private
    def tree_of node=nil
      organs = node.nil? ? Unirole::Organ.roots : node.children
      organs.map do |organ|
        { name: organ.name,
          id: organ.id
        }.merge(organ.has_children? ? {children: tree_of(organ)} : {})
      end
    end
  end
end

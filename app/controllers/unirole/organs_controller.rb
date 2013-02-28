#require_dependency "unirole/unirole_controller"

module Unirole
  class OrgansController < ApplicationController
    load_and_authorize_resource :class => Unirole::Organ
    respond_to :html, :json, :js

    def show 

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
        redirect_to  :controller =>"organs",:action=>"index"
      else
        flash[:notice] = "save error!"
        redirect_to :controller =>"organs",:action=>"index"
      end
    end

    private
    def tree_of node=nil
      organs = node.nil? ? Unirole::Organ.roots : node.children
      organs.map {|organ| { label: organ.name }.merge(organ.has_children? ? {children: tree_of(organ)} : {})}
    end
  end
end

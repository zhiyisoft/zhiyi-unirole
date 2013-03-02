module Unirole
  class OrgansController < ApplicationController
    load_and_authorize_resource :organ, class: Unirole::Organ
    respond_to :html, :json, :js
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }

    def index
      respond_with @organs
    end

    def new
      @parent = params[:parent_id] ? Unirole::Organ.find(params[:parent_id]) : nil
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
  end
end

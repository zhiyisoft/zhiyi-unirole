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
      @organ = Unirole::Organ.create(params[:organ])
      if @organ.save
        respond_with @organ
      else
        render :new
      end
    end
  end
end

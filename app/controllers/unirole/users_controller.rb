module Unirole
  class UsersController < ApplicationController
    load_and_authorize_resource class: Unirole::User
    respond_to :html, :json, :js
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }

    def index
      @organ = params[:organ_id] ? Unirole::Organ.find(params[:organ_id]) : nil
      if params[:page]
        page = params[:page]
        @users = Unirole::User.order_by(login: :asc).cache.paginate(page: page)
      end
      respond_with @users
    end


    def new
      respond_with @user
    end


    def create
      if @user.update_attributes(params[:user])
        respond_with @user
      else
        render :new
      end
    end

    def update
      if @user.update_attributes(params[:user])
        respond_with @user
      else
        redirect_to :back
      end
    end

    def destroy
      @user.delete
      respond_with @user
    end
  end
end

# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < ApplicationController
    respond_to :html, :json, :js
    load_and_authorize_resource class: Unirole::Actor
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }
    before_filter :find_user

    def index
      if @user
        @actors = @user.actors
      end
      respond_with @actors
    end

    def create
      respond_with @actor
    end

    def destroy
      if @user
        @user.actors.delete(@actor)
      end
      respond_with @actor
    end


    # ------------------------------------------------------------
    private

    ##
    # 大部分Actor操作都是针对某一特定用户的，
    # 但是考虑到其与用户的多对多关系，没有采用级联的方式。
    def find_user
      @user = params[:user_id] ? Unirole::User.find(params[:user_id]) : nil
    end
  end
end

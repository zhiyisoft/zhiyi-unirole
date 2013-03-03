# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < ApplicationController
    respond_to :html, :json, :js
    load_and_authorize_resource class: Unirole::Actor
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }

    def index
      @user = params[:user_id] ? Unirole::User.find(params[:user_id]) : nil
      if @user
        @actors = @user.actors
      end
      respond_with @actors
    end

    def create
      respond_with @actor
    end

    def destroy
      @actor.destroy
    end
  end
end

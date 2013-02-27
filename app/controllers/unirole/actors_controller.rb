# -*- coding: utf-8 -*-

module Unirole
  class ActorsController < ApplicationController
    respond_to :html, :json
    load_and_authorize_resource :class => Unirole::Actor

    def index
      respond_with @actors do |f|
        f.json { render json: @actors }
      end
    end

    def create
      respond_with @actor
    end

    def destroy
      @actor.destroy
    end
  end
end

# -*- coding: utf-8 -*-

#--
# 版权所有，成都知一软件有限公司
#++

#
# 行政等级控制器
#
class Unirole::RanksController < Unirole::ApplicationController

  authorize_resource class: Unirole::Rank
  respond_to :html, :json, :js

  def index

  end
 
  def show
  
  end

  def create
    if @rank.update_attributes(params[:rank])
      respond_with @rank
    else
      render :new
    end
  end

  def update
    if @rank.update_attribute(params[:rank])
      respond_with @rank
    else
      redirect_to :back
    end
  end

  def destroy
    @rank.delete
    respond_with @rank
  end
end

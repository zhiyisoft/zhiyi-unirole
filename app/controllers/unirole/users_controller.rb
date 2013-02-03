module Unirole
  class UsersController < UniroleController
    load_and_authorize_resource class: Unirole::User
    respond_to :html, :json, :js
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }

    def index
      page = params[:page] || 1
      @users = Unirole::User.order_by(login: :asc).cache.paginate(page: page)
      respond_with @users
    end

    def create
      if @user.update_attributes(params[:user])
        respond_with @user
      else
        render :new
      end
    end

    def update
      return redirect_to action: :show, id: @user.id if @user.update_attributes(params[:user])
      redirect_to :back
    end

    def destroy
      @user.delete
      respond_with @user
    end
  end
end

module Unirole
  class UsersController < UniroleController
    load_and_authorize_resource class: Unirole::User
    respond_to :html, :json, :js

    def index
      page = params[:page] || 1
      @users = Unirole::User.order_by(login: :asc).cache.paginate(page: page)
      respond_with @users
    end

    def create
      @user = Unirole::User.create(params[:user])
      return redirect_to action: :index if @user.save
      render :new
    end

    def update
      return redirect_to action: :show, id: @user.id if @user.update_attributes(params[:user])
      redirect_to :back
    end

    def destroy
    end
  end
end

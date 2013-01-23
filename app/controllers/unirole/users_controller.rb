module Unirole
  class UsersController < UniroleController
    before_filter CASClient::Frameworks::Rails::Filter
    load_resource class: Unirole::User, expect: [:index]
    authorize_resource class: Unirole::User

    def index
      page = params[:page] || 1
      @users = Unirole::User.all.cache.paginate(page: page)
    end

    def create
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

module Unirole
  class UsersController < UniroleController
    before_filter CASClient::Frameworks::Rails::Filter
    load_and_authorize_resource class: Unirole::User

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

module Unirole
  class UsersController < UniroleController

    before_filter CASClient::Frameworks::Rails::Filter
    load_and_authorize_resource class: Unirole::User

    def index
    end

    def create
    end  

    def edit
    end

    def update
      redirect_to action: :show, id: @user.id if @user.update_attributes(params[:user])
    end

    def destroy
    end
  end
end

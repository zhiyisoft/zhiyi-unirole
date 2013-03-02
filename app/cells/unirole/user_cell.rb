require "cell/rails/helper_api"

class Unirole::UserCell < Cell::Rails
  include Cell::Rails::HelperAPI

  def display(args)
    @organ = args[:organ]
    @users = @organ ? @organ.users : []
    render
  end

  def nav
  end

  def show(args)
    @user = args[:user]
    render
  end
end

require "cell/rails/helper_api"


module Unirole::UserHelpers
  def users_path(model)
    "/unirole/users"
  end
end


class Unirole::UserCell < Cell::Rails
  include Cell::Rails::HelperAPI
  self._helpers = Unirole::UserHelpers

  def display(args)
    @organ = args[:organ]
    @users = @organ ? @organ.users : []
    render
  end

  def new(args)
    @user = args[:user]
    render
  end

  def nav(args)
    @organ = args[:organ]
    render
  end

  def show(args)
    @user = args[:user]
    render
  end
end

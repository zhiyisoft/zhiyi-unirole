require "cell/rails/helper_api"


module Unirole::ActorHelpers
  def actors_path(model)
    "/unirole/actors"
  end
end


class Unirole::ActorCell < Cell::Rails
  include Cell::Rails::HelperAPI
  self._helpers = Unirole::ActorHelpers

  def display(args)
    @user = args[:user]
    render
  end

  def new(args)
    @user = args[:user]
    @actor = Unirole::Actor.new(membership: Unirole::Membership.default)
    @actor.users << @user
    render
  end

  def display_with_delete(args)
    @user = args[:user]
    render
  end
end

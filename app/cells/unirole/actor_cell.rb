class Unirole::ActorCell < Cell::Rails

  def display(args)
    @user = args[:user]
    render
  end

  def display_with_delete(args)
    @user = args[:user]
    render
  end
end

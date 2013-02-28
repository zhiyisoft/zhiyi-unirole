class Unirole::OrganCell < Cell::Rails

  def display
    @organs = Unirole::Organ.all
    render
  end

end

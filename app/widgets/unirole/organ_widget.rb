class Unirole::OrganWidget < Apotomo::Widget
  Apotomo::Widget.append_view_path File.join(File.dirname(__FILE__), "../")

  def display
    render
  end
end

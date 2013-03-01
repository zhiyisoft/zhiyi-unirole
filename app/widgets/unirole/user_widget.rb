class Unirole::UserWidget < Apotomo::Widget
  Apotomo::Widget.append_view_path File.join(File.dirname(__FILE__), "../")

  def display
    @path = File.join(File.dirname(__FILE__), "../../app/widgets")
    render
  end
end

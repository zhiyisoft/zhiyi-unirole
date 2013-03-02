class Unirole::OrganCell < Cell::Rails
  # include ActionController::UrlFor

  def display
    @organs = Unirole::Organ.all
    render
  end

  def tree(args)
    @tree = (make_tree args[:organs]).to_json.html_safe
    render
  end

  private
  def make_tree data=[]
    nodes = data.respond_to?(:children) ? data.children : data
    nodes.map do |node|
      { name: node.name,
        id: node.id,
        url: '/unirole/users'
      }.merge(node.has_children? ? {children: make_tree(node)} : {})
    end
  end
end

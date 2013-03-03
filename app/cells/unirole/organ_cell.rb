# -*- coding: utf-8 -*-
require "cell/rails/helper_api"


module Unirole::OrganHelpers
  def organs_path(model)
    "/unirole/organs"
  end
end


class Unirole::OrganCell < Cell::Rails
  include Cell::Rails::HelperAPI
  self._helpers = Unirole::OrganHelpers

  def display
    @organs = Unirole::Organ.all
    render
  end

  def title(args)
    @organ = args[:organ]
    return render if @organ
    render view: :blank
  end

  ##
  # 组织机构树
  def tree(args)
    @tree = (make_tree args[:organs]).to_json.html_safe
    render
  end

  def new(args)
    @parent = args[:parent]
    @organ = Unirole::Organ.new(parent: @parent)
    render
  end

  ##
  # 与一个组织机构相关的菜单导航条
  def nav(args)
    @organ = args[:organ]
    render
  end

  private
  def make_tree data=[]
    nodes = data.respond_to?(:children) ? data.children : data
    nodes.map do |node|
      tree_node(node).merge(node.has_children? ? {children: make_tree(node)} : {})
    end
  end

  def tree_node node
    { name: node.name,
        id: node.id,
        url: "/unirole/users?page=1&organ_id=#{node.id}"
    }
  end
end

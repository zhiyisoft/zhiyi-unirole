# -*- coding: utf-8 -*-
module Unirole
  class Navicate
  	class << self
  	  def all
  	  	[{:name => "用户管理",:url => "/unirole/users"},{:name => "身份职责",:url => "/unirole/memberships"},
  	  		{:name => "组织机构",:url => "/unirole/organs"},{:name => "行政等级",:url => "/unirole/ranks"}]
  	  end
  	end
  end
end
# -*- coding: utf-8 -*-
module Role
  class User < ActiveRecord::Base
    include Mongoid::Document    
    has_many :role ,:class_name => "Role::Role"
    
  end
end

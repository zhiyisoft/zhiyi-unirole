# -*- coding: utf-8 -*-
module Role
  class Role < ActiveRecord::Base
    include Mongoid::Document
    has_many :user ,:class_name => "Role::User"
    belongs_to :identity ,:class_name=>"Role::Identity"
    belongs_to :organization,:class_name=>"Role::Organization"
    
  end
end

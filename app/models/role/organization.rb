# -*- coding: utf-8 -*-
module Role
  class Organization < ActiveRecord::Base
    include Mongoid::Document
    belongs_to :rank,:class_name => "Role::Rank"    
    has_many  :role,:class_name=>"Role::Role"
    
  end
end

# -*- coding: utf-8 -*-
module Role
  class Rank < ActiveRecord::Base
    include Mongoid::Document
    has_many :organization,:class_name => "Role::Organization"

  end
end

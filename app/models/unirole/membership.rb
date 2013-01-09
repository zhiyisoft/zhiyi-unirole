# -*- coding: utf-8 -*-

module Unirole
  class Membership
    include Mongoid::Document

    field :name
    validate :name, :uniqueness => true, :presence => true

    has_many :actors, :class_name => "Unirole::Actor"

    def self.default
      find_or_create_by(name: '成员')
    end
  end
end

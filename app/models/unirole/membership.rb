# -*- coding: utf-8 -*-

module Unirole
  class Membership
    include Mongoid::Document

    field :name
    field :assignable, default: true
    has_many :actors, class_name: "Unirole::Actor"

    validates_presence_of :name
    validates_uniqueness_of :name

    scope :assignables, where(assignable: true)

    def self.default
      find_or_create_by(name: '成员')
    end
  end
end

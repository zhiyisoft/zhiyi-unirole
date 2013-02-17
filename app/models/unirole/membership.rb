# -*- coding: utf-8 -*-

module Unirole
  class Membership
    include Mongoid::Document

    field :name
    has_many :actors, class_name: 'Unirole::Actor'

    validates_presence_of :name
    validates_uniqueness_of :name

    def self.default_name
      I18n.t 'unirole.membership.member'
    end

    def self.default
      find_or_create_by name: default_name
    end

    def self.of arg
      where(name: arg).first
    end
  end
end

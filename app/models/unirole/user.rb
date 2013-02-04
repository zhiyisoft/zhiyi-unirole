# -*- coding: utf-8 -*-
require 'state_machine'

module Unirole
  class User
    @@manager = nil

    def self.manager
      @@manager
    end

    def self.manager= klass
      @@manager = klass.instance_of?(Class) ? klass : klass.to_s.constantize
    end


    include Mongoid::Document
    include Mongoid::Timestamps

    field :login
    field :sn
    field :cn
    field :name

    has_and_belongs_to_many :actors, class_name: 'Unirole::Actor'
    accepts_nested_attributes_for :actors
    attr_accessible :actors_attributes

    state_machine :state, initial: :unregistered do 
      event :register do
        transition [:unregistered] => :actived
      end

      event :lock do
        transition [:actived] => :locked
      end

      event :unlock do
        transition [:locked] => :actived
      end
    end

    validates_uniqueness_of :login
    validates_presence_of :sn, :cn, :login

    before_save do |u|
      u.name = u.sn + u.cn
    end

    after_update do |u|
      um = u.class.manager
      return unless um
      return u.register if um.exist?(u.login)

      um.add({
        uid: u.login,
        sn: u.sn,
        cn: u.cn,
        displayName: u.name,
        userPassword: u.login
      })
      u.register if um.exist?(u.login)
    end

    def organs
      actors.where(membership_id: Membership.default.id).map {|x| x.organ}.uniq
    end

    def member_of? organ, membership = Membership.default
      ms = membership.instance_of?(String) ? Membership.where(name: membership).first : membership
      return false if ms.nil?
      not actors.where(membership_id: ms.id, organ_id: organ.id).first.nil?
    end

    def take_on? actor
      actors.include?(actor)
    end
  end
end

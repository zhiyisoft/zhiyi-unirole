# -*- coding: utf-8 -*-
require 'state_machine'


module Unirole

  ##
  # = 用户管理
  #
  # == 挂载外接账号管理器
  # 目前可以支持LDAP账号管理，配置方法如下：
  #
  # === 添加 Gemfile
  # 在 Rails App中的Gemfile加上一行：
  #    gem 'zhiyi-member', :git => 'git@task.zhiyisoft.com:github/zhiyi-ldap-member.git'
  #
  # === 配置启动器
  # 在 Rails App中加入文件： #{RAILS_ROOT}/config/initializers/user_manager.rb，
  # 文件内容如下：
  #
  #    # Load the user manager
  #    Zhiyi::Member.load("#{Rails.root.to_s}/config/ldap.yaml")
  #
  #    require 'unirole/user'
  #    Unirole::User.manager = Zhiyi::Member::User
  #
  # === 配置LDAP
  # 添加LDAP配置文件，放置在上述位置：#{RAILS_ROOT}/config/ldap.yaml，
  # 文件内容格式如下：
  #   host: repos.zhiyisoft.com
  #   port: 389
  #   base:
  #     base: dc=soatour,dc=org
  #     person: ou=people,dc=soatour,dc=org
  #   attr:
  #     - displayName
  #     - uid
  #     - sn
  #     - cn
  #     - userPassword
  #   objectclass:
  #     - inetOrgPerson
  #     - organizationalPerson
  #     - top
  #     - person
  #   bind:
  #     dn: cn=admin,dc=soatour,dc=org
  #     passwd: XXXXX
  # 以上 dc=soatour,dc=org 等应根据实际需要变更，passwd 也应根据实际情况变更
  #
  # === 使用
  # bundle 后重新启动 Rails，无需在代码中增加任何操作，即可挂载到LDAP中，其效果如下：
  # - 在新增用户时，如果LDAP中未存在新增的用户账号，会自动注册一个新账号，口令与登录账号相同
  # - 如果用户账号在LDAP已经存在，将不会变动LDAP中的任何信息，即使用户姓名等信息与LDAP中不一致，也不会变更

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

    def actors_attributes=(attrs)
      attrs.each do |_, attr|
        unless actors.where(attr).first
          actors << Unirole::Actor.find_or_create_by(attr)
        end
      end
    end

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

    before_save do |user|
      user.name = user.sn + user.cn
    end

    #因为不同的系统用户的属性不一致，所以需要分别在各个系统中实现after_create方法
    #after_create do |u|
      #um = u.class.manager
      #return unless um
      #return u.register if um.exist?(u.login)

      #um.add({
        #uid: u.login,
        #sn: u.sn,
        #cn: u.cn,
        #displayName: (u.sn + u.cn),
        #userPassword: u.login
      #})
      #u.register if um.exist?(u.login)
    #end

    def organs(only_member = false)
      as = only_member ? actors.where(membership_id: Membership.default.id) : actors
      as.map {|x| x.organ}.uniq 
    end

    def member_of? organ, membership = Membership.default
      ms = membership.instance_of?(String) ? Membership.where(name: membership).first : membership
      return false if ms.nil?
      not actors.where(membership_id: ms.id, organ_id: organ.id).first.nil?
    end

    def take_on? actor
      actors.include?(actor)
    end


    ##
    # 检查一名用户是否在其角色中拥有某种身份
    #
    # 可以使用身份的名称：
    #
    #    user.has_membership_of? '领导'
    #
    # 也可以使用身份的对象：
    #
    #    ship = Unirole::Membership.find_by(name: '领导')
    #    user.has_membership_of? ship
    #
    def has_membership_of?(membership)
      if membership.instance_of?(String)
        ship = Unirole::Membership.where(name: membership).first
        return false unless ship
      else
        ship = membership
      end
      actors.where(membership: ship).count > 0
    end
  end
end

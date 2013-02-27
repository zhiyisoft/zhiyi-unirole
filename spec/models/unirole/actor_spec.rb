# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe Actor do
    before :each do
      chu_rank = create :chu_rank
      ke_rank = create :ke_rank
      leader = create :leader

      @snqk_organ = create :snqk_organ, rank: chu_rank, parent: nil
      kaifa = create :snqk_kaifa, rank: ke_rank, parent: @snqk_organ

      @snqk_leader = create :snqk_leader, organ: @snqk_organ, membership: leader
      @kaifa_ke_leader = create :snqk_kaifa_leader, organ: kaifa, membership: leader
    end

    it '角色名称类转为字符串' do
      @snqk_leader.to_s.should == '蜀南气矿:领导'
      @kaifa_ke_leader.to_s.should == '蜀南气矿/开发科:领导'
    end

    it '由字符串转为角色' do
      '蜀南气矿:领导'.to_actor.should == @snqk_leader
      '蜀南气矿/开发科:领导'.to_actor.should == @kaifa_ke_leader
    end

    it '不存在的组织结构应当报错' do
      expect {'重庆气矿/开发科:领导'.to_actor}.to raise_error
    end

    it '不标准的角色字符串编码应当报错' do
      expect {'蜀南气矿/开发科/领导'.to_actor}.to raise_error
      expect {'我是打酱油的'.to_actor}.to raise_error
    end

    it '无身份标识时应该默认为该组织的成员角色' do
      '蜀南气矿/开发科'.to_actor.membership.name.should == '成员'
    end

    it '无身份标识，并且该组织的成员角色不存在时，应自动添加该角色' do
      snqk_member = '蜀南气矿'.to_actor
      snqk_member.membership.name.should == '成员'
    end
  end
end

# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe Organ do
    
    before(:each) do
      [ :snqk_organ, :chongqing_organ ].each do |x|
        instance_variable_set("@#{x}".to_sym, FactoryGirl.create(x))
      end
    end

    describe "上下级单位" do
      it "单位有可能不存在上级单位" do
        @snqk_organ.parent.should == nil
      end

      it "任一单位可以有多个下级单位，或者没有" do
        @snqk_organ.children.should include("蜀南气矿/开发科".to_organ)
        "蜀南气矿/开发科/钻井组".to_organ.children.count.should == 0
        "重庆气矿/开发科".to_organ.children.count.should == 0
      end

      it "任一单位的下属单位只能是直接下级" do
        @snqk_organ.children.should_not include("蜀南气矿/开发科/钻井组".to_organ)
      end

      it "上级单位的等级必须高于下级单位" do
        kaifa_ke = "蜀南气矿/开发科".to_organ
        kaifa_ke.rank.member_of?(@snqk_organ.rank).should be_true

        kaifa_ke.parent = "蜀南气矿/开发科/钻井组".to_organ
        expect { kaifa_ke.save! }.to raise_error
      end
    end

    describe "单位全名" do
      it "顶级单位全名即自身名称" do
        @snqk_organ.full_name.should == @snqk_organ.name
      end

      it "二级单位或者三级单位全名包括所有上级单位层次" do
        @chongqing_organ.children.first.full_name.should == "重庆气矿/开发科"
      end
    end
  end
end

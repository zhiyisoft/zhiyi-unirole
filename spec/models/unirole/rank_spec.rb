# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole

  describe Rank do
    before(:each) do
      # 序列化版本
      @province = create :province_rank
      @area = create :area_rank, parent: @province
      @city = create :city_rank, parent: @area

      # 排序号版本
      @chu = create :chu_rank
      @ke = create :ke_rank
      @gu = create :gu_rank
    end

    ##
    # 序列化版本的测试
    describe "组织机构等级的序列" do
      it "每个等级都应该有父节点" do
        @province.parent.should be_nil
        @area.parent.should == @province
        @city.parent.should == @area
      end

      it "低级别始终可以成为高级别的子等级" do
        @city.member_of?(@province).should be_true
        @area.member_of?(@city).should be_false
        @area.member_of?(@area).should be_false
      end

      it "下属机构是允许跨层级的" do
        @province.subs.should be_include(@city)
        @city.subs.count.should == 0
      end
    end

    ##
    # 兼容排序号版本的测试
    describe "按单位等级评定某一等级是否可以成为另一等级的子等级" do
      it "同一级别不能成为子等级" do
        @chu.member_of?(@chu).should == false
      end

      it "高级别不能成为低级别的子等级" do
        @chu.member_of?(@ke).should == false
        @chu.member_of?(@gu).should == false
      end

      it "低级别的可以成为高级别的子等级" do
        @ke.member_of?(@chu).should == true
        @gu.member_of?(@chu).should == true
      end

      it "下属机构是允许跨层级的" do
        @chu.subs.should be_include(@gu)
        @gu.subs.count.should == 0
      end
    end
  end
end

# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe Rank do
    before(:each) do 
      (@chu, @ke, @gu) = [:chu_rank, :ke_rank, :gu_rank].map {|x| FactoryGirl.create x}
    end

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
    end
  end
end

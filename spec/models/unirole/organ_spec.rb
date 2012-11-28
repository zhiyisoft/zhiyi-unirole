# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe Organ do
    
    before(:each) do
    
      [:chu_rank, :ke_rank, :gu_rank].each {|x| FactoryGirl.create x}

      (@snqk_organ, @chongqing_organ, 
       @cq_kaifa_ke, @kaifa_ke, @dijian_ke, 
       @gongcheng_team, @zuanjin_team) = 
        [:snqk_organ, :chongqing_organ, 
         :cq_kaifa_ke, :kaifa_ke, :dijian_ke, 
         :gongcheng_team, :zuanjin_team].map {|x| FactoryGirl.create x}
    end

    describe "上下级单位" do
      it "单位有可能不存在上级单位" do
        @snqk_organ.parent.should == nil
      end

      it "任一单位可以有多个下级单位，或者没有" do
        @snqk_organ.children.should include(@kaifa_ke)
        @zuanjin_team.children.size.should == 0
        @cq_kaifa_ke.children.size.should == 0
      end

      it "任一单位的下属单位只能是直接下级" do
        @snqk_organ.children.should include(@kaifa_ke)
        @kaifa_ke.children.should include(@zuanjin_team)
        @snqk_organ.children.should_not include(@zuanjin_team)
      end

      it "上级单位的等级必须高于下级单位" do
        @kaifa_ke.rank.member_of?(@snqk_organ.rank).should be_true
        expect {@kaifa_ke.update_attributes(:parent => @zuanjin_team)}.to raise_error
      end
    end

    describe "单位全名" do
      it "顶级单位全名即自身名称" do
        @snqk_organ.full_name.should == @snqk_organ.name
      end

      it "二级单位或者三级单位全名包括所有上级单位层次" do
        @kaifa_ke.full_name.should == "#{@snqk_organ.name}/#{@kaifa_ke.name}"
        @zuanjin_team.full_name.should == "#{@snqk_organ.name}/#{@kaifa_ke.name}/#{@zuanjin_team.name}"
      end

      it "由单位全名推导单位" do
        "#{@snqk_organ.name}/#{@kaifa_ke.name}/#{@zuanjin_team.name}".to_organ.should == @zuanjin_team
        "#{@snqk_organ.name}/#{@kaifa_ke.name}".to_organ.should == @kaifa_ke
        "#{@snqk_organ.name}".to_organ.should == @snqk_organ
        expect {"#{@chongqing_organ.name}/#{@kaifa_ke.name}/#{@zuanjin_team.name}".to_organ}.to raise_error
        expect {"#{@snqk_organ.name}/#{@dijian_ke.name}/#{@zuanjin_team.name}".to_organ}.to raise_error
      end
    end
  end
end

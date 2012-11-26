# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe Organ do
    
    before(:each) do
    
      [:chu_rank, :ke_rank, :gu_rank].each {|x| FactoryGirl.create x}

      (@snqk_organ, @chongqing_organ, @kaifa_ke, @dijian_ke, @gongcheng_team, @zuanjin_team) = 
        [:snqk_organ, :chongqing_organ, 
         :kaifa_ke, :dijian_ke, 
         :gongcheng_team, :zuanjin_team].map {|x| FactoryGirl.create x}
    end

    describe "上下级单位" do
      it "任一单位最多只能有一个上级单位" do
        [@snqk_organ, @chongqing_organ].should include(@kaifa_ke.parent)
        @snqk_organ.parent.should == nil
      end

      it "任一单位可以有多个下级单位，或者没有" do
        @snqk_organ.children.should include(@kaifa_ke)
        @zuanjin_team.children.size.should == 0
        @chongqing_organ.children.size.should == 0
      end

      it "任一单位的下属单位只能是直接下级" do
        @snqk_organ.children.should include(@kaifa_ke)
        @kaifa_ke.children.should include(@zuanjin_team)
        @snqk_organ.children.should_not include(@zuanjin_team)
      end
    end  
  end
end

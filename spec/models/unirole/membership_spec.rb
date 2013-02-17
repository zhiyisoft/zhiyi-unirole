# -*- coding: utf-8 -*-

require 'spec_helper'

module Unirole
  describe Membership do

    before(:each) do
      [:leader, :member].each {|x| FactoryGirl.create x}
    end

    it 'I18n的默认名称' do
      Membership.default_name.should == '成员'
    end

    it '按名称定位角色' do
      Membership.of('领导').name.should == '领导'
    end
  end
end

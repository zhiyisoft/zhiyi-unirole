# -*- coding: utf-8 -*-

FactoryGirl.define do
  { :snqk_leader => ["蜀南气矿", "领导"], 
    :kaifa_ke_leader => ["蜀南气矿/开发科", "领导"],
    :kaifa_ke_member => ["蜀南气矿/开发科", "成员"]}.each do |k,(v,m)|
    factory k, :class => Unirole::Actor do
      before(:create) do |f|
        f.membership = Unirole::Membership.find_by(:name => m)
        f.organ = v.to_organ
      end
    end 
  end
end

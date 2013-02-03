# -*- coding: utf-8 -*-

FactoryGirl.define do
  { snqk_leader: [:snqk_organ, :leader], 
    kaifa_ke_leader: [:kaifa_ke, :leader],
    kaifa_ke_member: [:kaifa_ke, :member]}.each do |k,(v,m)|
    factory k, class: Unirole::Actor do
      association :organ, factory: v
      association :membership, factory: m
    end
  end
end

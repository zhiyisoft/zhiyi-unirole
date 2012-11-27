# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :leader, :class => Unirole::Membership do
    name "领导"
  end       
  factory :member, :class => Unirole::Membership do
    name "成员"
  end       
end

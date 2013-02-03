# -*- coding: utf-8 -*-

FactoryGirl.define do
  to_create {|x| x.save}
  
  factory :membership, class: Unirole::Membership do
    factory :leader do
      name "领导"
    end

    factory :member do
      name "成员"
    end
  end       
end

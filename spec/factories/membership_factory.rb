# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :membership, class: Unirole::Membership do

    to_create do |x|
      x.class.find_or_create_by(name: x.name)
    end

    factory :leader do
      name "领导"
    end

    factory :member do
      name "成员"
    end
  end       
end

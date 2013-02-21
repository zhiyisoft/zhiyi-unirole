# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :snqk_actor, class: Unirole::Actor do

    organ
    membership

    factory :snqk_leader
    factory :snqk_kaifa_leader
  end
end

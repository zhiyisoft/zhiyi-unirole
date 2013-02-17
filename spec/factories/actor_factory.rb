# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :snqk_actor, class: Unirole::Actor do
    factory :snqk_leader do
      before :create do |x|
        x.organ = "蜀南气矿".to_organ
        x.membership = Unirole::Membership.of("领导")
      end
    end

    factory :kaifa_ke_leader do
      before :create do |x|
        x.organ = "蜀南气矿/开发科".to_organ
        x.membership = Unirole::Membership.of("领导")
      end
    end
  end
end

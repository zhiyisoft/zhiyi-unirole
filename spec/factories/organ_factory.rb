# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :organ, class: Unirole::Organ, aliases: [:parent] do

    rank
    parent

    factory :chongqing_organ do
      name "重庆气矿"
    end

    factory :chongqing_kaifa do
      name "开发科"
    end

    factory :snqk_organ do
      name "蜀南气矿"
    end

    factory :snqk_kaifa do
      name "开发科"
    end

    factory :snqk_djk do
      name "地建科"
    end

    factory :snqk_kaifa_gc do
      name "工程组"
    end

    factory :snqk_kaifa_zj do
      name "钻井组"
    end
  end
end

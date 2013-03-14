# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :rank, class: Unirole::Rank do

    ##
    # 目前已经序列化，但仍然保留以前操作

    factory :chu_rank do
      seq 10
      name "处级"
    end

    factory :ke_rank do
      seq 20
      name "科级"
    end

    factory :gu_rank do
      seq 30
      name "股级"
    end


    ##
    # 以下是序列化后的版本，不设置排序号
    factory :province_rank do
      name "省、自治区、直辖市"
      parent nil
    end

    factory :area_rank do
      name "地区"
      association :parent, factory: :province_rank
    end

    factory :city_rank do
      name "市县"
      association :parent, factory: :area_rank
    end
  end
end

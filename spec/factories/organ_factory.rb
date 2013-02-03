# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :organ, class: Unirole::Organ do
    factory :chongqing_organ do
      name "重庆气矿"

      before :create do |x|
        x.rank = Unirole::Rank.find_or_create_by(name: '处级', seq: 10)
      end
      
      after :create do |x|
        x.children.create name: "开发科", rank: Unirole::Rank.find_or_create_by(name: '科级', seq: 20)
      end
    end 

    factory :snqk_organ do
      name "蜀南气矿"

      before :create do |x|
        x.rank = Unirole::Rank.find_or_create_by(name: '处级', seq: 10)
      end
      
      after :create do |x|
        x.children.create name: "开发科", rank: Unirole::Rank.find_or_create_by(name: '科级', seq: 20)
        x.children.create name: "地建科", rank: Unirole::Rank.find_or_create_by(name: '科级', seq: 20)
        y = x.children.first
        y.children.create name: "工程组", rank: Unirole::Rank.find_or_create_by(name: '股级', seq: 30)
        y.children.create name: "钻井组", rank: Unirole::Rank.find_or_create_by(name: '股级', seq: 30)
      end
    end
  end
end

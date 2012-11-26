# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :snqk_organ, :class => Unirole::Organ do
    name "蜀南气矿"
    before(:create) do |f|
      f.rank = Unirole::Rank.find_by(:name => '处级')
    end
  end 

  factory :chongqing_organ, :class => Unirole::Organ do
    name "重庆气矿"
    before(:create) do |f|
      f.rank = Unirole::Rank.find_by(:name => '处级')
    end
  end
  
  {:kaifa_ke => "开发科", :dijian_ke => "地建科"}.each do |k,v|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.find_by(:name => '科级')
        f.parent = Unirole::Organ.find_by(:name => '蜀南气矿')
      end
    end
  end

  {:gongcheng_team => "工程组", :zuanjin_team => "钻井组"}.each do |k,v|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.find_by(:name => '股级')
        f.parent = Unirole::Organ.find_by(:name => '开发科')
      end
    end
  end
 
end

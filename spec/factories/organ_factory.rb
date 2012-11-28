# -*- coding: utf-8 -*-

FactoryGirl.define do
  {:snqk_organ => "蜀南气矿", :chongqing_organ => "重庆气矿"}.each do |k,v|
    factory k, :class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.find_by(:name => '处级')
      end
    end 
  end
  
  { :cq_kaifa_ke => ["重庆气矿", "开发科"], 
    :kaifa_ke => ["蜀南气矿", "开发科"], 
    :dijian_ke => ["蜀南气矿", "地建科"]}.each do |k,(chu, v)|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.find_by(:name => '科级')
        f.parent = Unirole::Organ.find_by(:name => chu)
      end
    end
  end

  {:gongcheng_team => "工程组", :zuanjin_team => "钻井组"}.each do |k,v|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.find_by(:name => '股级')
        f.parent = Unirole::Organ.find_by(:name => '开发科', :parent => '蜀南气矿'.to_organ)
      end
    end
  end
 
end

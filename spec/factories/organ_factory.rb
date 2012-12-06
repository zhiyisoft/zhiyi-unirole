# -*- coding: utf-8 -*-

FactoryGirl.define do
  {:snqk_organ => "蜀南气矿", :chongqing_organ => "重庆气矿"}.each do |k,v|
    factory k, :class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.where(:name => '处级').first
      end
    end 
  end
  
  { :cq_kaifa_ke => ["重庆气矿", "开发科"], 
    :kaifa_ke => ["蜀南气矿", "开发科"], 
    :dijian_ke => ["蜀南气矿", "地建科"]}.each do |k,(chu, v)|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.where(:name => '科级').first
        f.parent = Unirole::Organ.where(:name => chu).first
      end
    end
  end

  {:gongcheng_team => "工程组", :zuanjin_team => "钻井组"}.each do |k,v|
    factory k,:class => Unirole::Organ do
      name v
      before(:create) do |f|
        f.rank = Unirole::Rank.where(:name => '股级').first
        f.parent = Unirole::Organ.where(:name => '开发科', :parent_id => '蜀南气矿'.to_organ.id).first
      end
    end
  end
 
end

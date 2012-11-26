# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :chu_rank, :class => Unirole::Rank do
    seq 10
    name "处级"
  end       
  factory :ke_rank, :class => Unirole::Rank do
    seq 20
    name "科级"
  end       
  factory :gu_rank, :class => Unirole::Rank do
    seq 30
    name "股级"
  end       

end

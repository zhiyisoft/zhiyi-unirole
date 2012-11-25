# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :chu_rank, :class => Unirole::Rank do
    seq 10
    name "处级"
  end
end

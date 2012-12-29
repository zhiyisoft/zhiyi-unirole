# -*- coding: utf-8 -*-

module Unirole
  class Actor
    include Mongoid::Document

    belongs_to :membership, :class_name => "Unirole::Membership"
    belongs_to :organ, :class_name => "Unirole::Organ"
    has_and_belongs_to_many :users, class_name: 'Unirole::User'

    key :organ_id, :membership_id
    cache

    def to_s
      organ.full_name + ":" + membership.name
    end
  end
end


class String
  def to_actor
    (organ_str, membership_str) = self.split(":")
    membership_str = '成员' unless membership_str
    if membership_str == '成员' then 
      Unirole::Actor.find_or_create_by(:organ_id => organ_str.to_organ.id, 
                          :membership_id => Unirole::Membership.where(:name => membership_str).first.id)
    else 
      Unirole::Actor.where(:organ_id => organ_str.to_organ.id, 
                           :membership_id => Unirole::Membership.where(:name => membership_str).first.id).first
    end
  end
end

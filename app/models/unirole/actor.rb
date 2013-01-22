# -*- coding: utf-8 -*-

require 'unirole/organ'

module Unirole
  class Actor
    include Mongoid::Document

    belongs_to :membership, class_name: "Unirole::Membership"
    belongs_to :organ, class_name: "Unirole::Organ"
    has_and_belongs_to_many :users, class_name: 'Unirole::User'

    validates_uniqueness_of :organ_id, scope: [:membership_id]

    scope :assignables, where(:membership.in => Unirole::Membership.assignables)

    def to_s
      organ.full_name + ":" + membership.name
    end
  end
end


class String
  def to_actor
    (organ_str, membership_str) = self.split(":")
    membership_str = Unirole::Membership.default_name unless membership_str
    if membership_str ==  Unirole::Membership.default_name then 
      Unirole::Actor.find_or_create_by(organ_id: organ_str.to_organ.id,
                                       membership_id: Unirole::Membership.default.id)
    else
      Unirole::Actor.where(organ_id: organ_str.to_organ.id,
                           membership_id: Unirole::Membership.where(name: membership_str).first.id).first
    end
  end
end

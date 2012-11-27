# -*- coding: utf-8 -*-

module Unirole
  class Actor
    include Mongoid::Document

    belongs_to :membership, :class_name => "Unirole::Membership"
    belongs_to :organ, :class_name => "Unirole::Organ"

    def to_s
      organ.full_name + ":" + membership.name
    end
  end
end


class String
  def to_actor
    (organ_str, membership_str) = self.split(":")
    membership_str = '成员' unless membership_str
    func = if membership_str == '成员' then :find_or_create_by else :find_by end

    Unirole::Actor.send(func, 
                        { :organ => organ_str.to_organ, 
                          :membership => Unirole::Membership.find_by(:name => membership_str)})
  end
end

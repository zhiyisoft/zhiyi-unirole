require 'mongoid-ancestry'

module Unirole
  class Organ
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Ancestry
    has_ancestry

    field :name
    belongs_to :rank, class_name: "Unirole::Rank"
    has_many :actors, class_name: "Unirole::Actor"
    index({ancestry: 1})

    validates_presence_of :name, :rank
    validates_uniqueness_of :name, :scope => [:ancestry]
    validate :validate_rank

    def validate_rank
      return unless parent
      raise unless self.rank.member_of?(self.parent.rank)
    end

    after_create do |o|
      Unirole::Actor.find_or_create_by(organ: o, membership: Unirole::Membership.default)
    end

    def full_name
      return name unless parent
      parent.full_name + "/" + name
    end

    def users
      actors.where(membership_id: Membership.default.id).map {|x| x.users}.flatten.uniq
    end

    def self.departments
      excludes(ancestry: nil)
    end

    def self.find_by_full_name leader, names
      chain = if names.instance_of?(Array) then names else names.split('/') end
      raise "Name of Organ can't be null." if chain.size == 0

      unless leader
        me = Organ.roots.where(name: chain.first).first
      else
        me = leader.children.where(name: chain.first).first
      end

      raise "Organ #{chain.first} is not exist!" unless me
      return me if chain.size == 1
      return Organ.find_by_full_name(me, chain.drop(1))
    end
  end
end

class String
  def to_organ
    Unirole::Organ.find_by_full_name nil, self
  end
end

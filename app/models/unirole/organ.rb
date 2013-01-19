require 'mongoid-ancestry'

module Unirole
  class Organ
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Ancestry
    has_ancestry

    field :name
    belongs_to :rank, :class_name => "Unirole::Rank"
    has_many :actors, :class_name => "Unirole::Actor"
    index({ancestry: 1})

    validates_presence_of :name
    validates_uniqueness_of :name, :scope => [:ancestry]

    after_create do |o|
      Unirole::Actor.create(organ: o, membership: Unirole::Membership.default)
    end

    def full_name
      return name unless parent
      parent.full_name + "/" + name
    end

    def users
      actors.where(membership_id: Membership.default.id).map {|x| x.users}.flatten.uniq
    end
    
    def self.departments
      excludes(parent_id: nil)
    end 


    def self.find_by_full_name leader, names
      chain = if names.instance_of?(Array) then names else names.split('/') end
      raise "Name of Organ can't be null." if chain.size == 0
      me = Organ.where(:name => chain.first, :parent_id => (leader.nil? ? nil : leader.id)).first

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

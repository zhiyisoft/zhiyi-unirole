module Unirole
  class Organ
    include Mongoid::Document

    field :name
    validate :name, :presence => true

    belongs_to :rank, :class_name => "Unirole::Rank" 
    belongs_to :parent, :class_name => "Unirole::Organ", :foreign_key => "parent_id"
    validate :validate_on_parent

    def validate_on_parent
      return unless parent
      unless rank.member_of?(parent.rank)
        raise "Parent Error"
      end
    end

    def children
      Organ.where(:parent_id => _id).inject([])  {|s,x| s << x}
    end

    def full_name
      return name unless parent
      parent.full_name + "/" + name
    end

    def self.find_by_full_name names
      chain = if names.instance_of?(Array) then names else names.split('/') end
      raise "Name of Organ can't be null." if chain.size == 0
      return Organ.find_by(:name => chain.first) if chain.size == 1

      child = Organ.find_by(:name => chain.last)
      return child if Organ.find_by_full_name(chain.take(chain.size-1)) == child.parent
      raise "Not a valid organ full name."
    end
  end
end

class String
  def to_organ
    Unirole::Organ.find_by_full_name self
  end
end

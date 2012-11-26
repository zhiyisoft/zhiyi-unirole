module Unirole
  class Organ
    include Mongoid::Document

    field :name
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
  end
end

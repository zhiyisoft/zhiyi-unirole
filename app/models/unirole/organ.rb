module Unirole
  class Organ
    include Mongoid::Document

    field :name
    belongs_to :rank, :class_name => "Unirole::Rank" 
    belongs_to :parent, :class_name => "Unirole::Organ", :foreign_key => "parent_id"
    
    def children
      Organ.where(:parent_id => _id).inject([])  {|s,x| s << x}
    end
  end
end

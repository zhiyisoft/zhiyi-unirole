module Unirole
  class Rank
    include Mongoid::Document

    field :seq, :type => Integer
    validates :seq, :presence => true

    field :name, :type => String
    validates :name, :uniqueness => true, :presence => true
    
    def member_of? other 
      seq > other.seq
    end
  end
end

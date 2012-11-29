module Unirole
  class Rank
    include Mongoid::Documenbt

    field :seq, :type => Integer
    validates :seq, :presence => true

    field :name, :type => String
    validates :name, :uniqueness => true, :presence => true

    has_many :organs, :class_name => "Unirole::Organ"

    def member_of? other 
      seq > other.seq
    end
  end
end

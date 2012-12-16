module Unirole
  class Rank
    include Mongoid::Document

    field :seq, :type => Integer
    validates :seq, :presence => true

    field :name, :type => String
    validates :name, :uniqueness => true, :presence => true

    field :normal, :type => Boolean, :default => true

    has_many :organs, :class_name => "Unirole::Organ"
    cache

    def member_of? other 
      seq > other.seq
    end
  end
end

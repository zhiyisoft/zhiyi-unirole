module Unirole
  class Rank
    include Mongoid::Document

    field :seq, :type => Integer
    validates :seq, :uniqueness => true, :presence => true

    field :name, :type => String
    validates :name, :uniqueness => true, :presence => true
  end
end

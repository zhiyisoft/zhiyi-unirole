module Unirole
  class Membership
    include Mongoid::Document

    field :name
    validate :name, :uniqueness => true, :presence => true

    has_many :actors, :class_name => "Unirole::Actor"

    cache
  end
end

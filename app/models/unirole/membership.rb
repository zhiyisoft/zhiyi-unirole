module Unirole
  class Membership
    include Mongoid::Document

    field :name
    validate :name, :uniqueness => true, :presence => true

    has_many :actor, :class_name => "Unirole::Actor"
  end
end

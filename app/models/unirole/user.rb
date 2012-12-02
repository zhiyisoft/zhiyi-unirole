module Unirole
  class User
    include Mongoid::Document

    field :login
    validates :login, :uniqueness => true, :presence => true

    field :name
    validates :name, :presence => true

    has_and_belongs_to_many :actors, :class_name => "Unirole::Actor"
  end
end

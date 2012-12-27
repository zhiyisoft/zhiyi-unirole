module Unirole
  class User
    include Mongoid::Document

    field :login
    validates :login, :uniqueness => true, :presence => true

    field :name
    validates :name, :presence => true

    has_and_belongs_to_many :actors, :class_name => "Unirole::Actor"
    cache

    def organs
      actors.where(membership_id: Unirole::Membership.default.id).map {|x| x.organ}.uniq
    end

    def member_of? organ
      organs.map {|x| x.id}.include?(organ.id)
    end
  end
end

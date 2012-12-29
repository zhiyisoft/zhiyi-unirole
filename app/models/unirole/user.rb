module Unirole
  class User
    include Mongoid::Document

    field :login
    validates :login, :uniqueness => true, :presence => true

    field :name
    validates :name, :presence => true

    has_and_belongs_to_many :actors, class_name: 'Unirole::Actor'
    cache

    def organs
      actors.where(membership_id: Membership.default.id).map {|x| x.organ}.uniq
    end

    def member_of? organ, membership = Membership.default
      ms = membership.instance_of?(String) ? Membership.where(name: membership).first : membership
      return false if ms.nil?
      not actors.where(membership_id: ms.id, organ_id: organ.id).first.nil?
    end
  end
end

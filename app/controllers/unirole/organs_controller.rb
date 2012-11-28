#require_dependency "unirole/unirole_controller"

module Unirole
  class OrgansController < UniroleController
    def index
      @organs = Organ.where(:parent_id=>nil)
    end
  end
end

# require_dependency "unirole/application_controller"

module Unirole
  class DashboardController < UniroleController
    def index
      p "dashboard controller"
      render :layout => (not request.xhr?)
    end
  end
end

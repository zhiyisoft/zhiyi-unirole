# require_dependency "unirole/application_controller"

module Unirole
  class DashboardController < UniroleController
  	skip_authorization_check
    def index
    end
  end
end

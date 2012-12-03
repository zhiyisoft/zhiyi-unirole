# require_dependency "unirole/application_controller"

module Unirole
  class UniroleController < ActionController::Base
    layout "application"
    render :layout => (not request.xhr?)
  end
end

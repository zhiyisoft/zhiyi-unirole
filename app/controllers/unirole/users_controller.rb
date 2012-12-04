#require_bdependency "unirole/unirole_controller"

module Unirole
  class UsersController < UniroleController
    def index 
      @users = [
                {:username =>"test1"},
                {:username =>"test2"},
                {:username =>"test3"},
                {:username =>"test4"},
                {:username =>"test5"},
                {:username =>"test6"}
              ]
      respond_to do |format|
        format.html { render :layout => (not request.xhr?)}
        format.json {render :json=>@users}
      end
    end
  end
end

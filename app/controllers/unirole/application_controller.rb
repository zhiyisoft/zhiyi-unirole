module Unirole
  class ApplicationController < ::ApplicationController
    layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }
  end
end

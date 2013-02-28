require 'spec_helper'

module Unirole
  describe OrgansController do
    it { get :index, use_route: :unirole }
  end
end

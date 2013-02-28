# -*- coding: utf-8 -*-
require 'spec_helper'

module Unirole
  describe OrgansController do

    before(:each) do
      create :snqk_organ, rank: (create :chu_rank), parent: nil
    end

    it '显示组织机构' do
      get :index, use_route: :unirole
      response.should be_success
    end
  end
end

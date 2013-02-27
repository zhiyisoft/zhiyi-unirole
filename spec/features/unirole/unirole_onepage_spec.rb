# -*- coding: utf-8 -*-

require 'spec_helper'

feature "单页应用" do
  scenario "首页" do
    visit '/unirole'
    page.should have_content('组织机构')
  end
end

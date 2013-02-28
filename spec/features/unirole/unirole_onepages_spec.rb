# -*- coding: utf-8 -*-
require 'spec_helper'

describe '独立页面测试' do

  describe '显示组织机构', js: true do
    before(:each) do
      create :snqk_organ, rank: (create :chu_rank), parent: nil
    end

    it '显示存在的组织机构' do
      visit organs_path
      page.should have_content('蜀南气矿')
    end
  end
end

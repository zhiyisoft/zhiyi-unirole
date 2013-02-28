# -*- coding: utf-8 -*-
require 'spec_helper'

describe "unirole/organs/index" do

  before(:each) do
    create :snqk_organ, rank: (create :chu_rank), parent: nil
  end

  it '显示全部组织机构' do
    render
    rendered.should include('蜀南气矿')
  end
end

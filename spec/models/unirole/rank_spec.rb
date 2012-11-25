require 'spec_helper'

module Unirole
  describe Rank do
    before(:each) do 
      FactoryGirl.create :chu_rank
    end

    it "" do
      "2".to_i.should == 2
    end
  end
end

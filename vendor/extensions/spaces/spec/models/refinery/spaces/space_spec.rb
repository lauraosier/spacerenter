require 'spec_helper'

module Refinery
  module Spaces
    describe Space do
      describe "validations" do
        subject do
          FactoryGirl.create(:space,
          :owner => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:owner) { should == "Refinery CMS" }
      end
    end
  end
end

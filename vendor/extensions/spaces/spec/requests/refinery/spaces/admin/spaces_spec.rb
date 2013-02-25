# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Spaces" do
    describe "Admin" do
      describe "spaces" do
        login_refinery_user

        describe "spaces list" do
          before do
            FactoryGirl.create(:space, :owner => "UniqueTitleOne")
            FactoryGirl.create(:space, :owner => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.spaces_admin_spaces_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.spaces_admin_spaces_path

            click_link "Add New Space"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Owner", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Spaces::Space.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Owner can't be blank")
              Refinery::Spaces::Space.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:space, :owner => "UniqueTitle") }

            it "should fail" do
              visit refinery.spaces_admin_spaces_path

              click_link "Add New Space"

              fill_in "Owner", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Spaces::Space.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:space, :owner => "A owner") }

          it "should succeed" do
            visit refinery.spaces_admin_spaces_path

            within ".actions" do
              click_link "Edit this space"
            end

            fill_in "Owner", :with => "A different owner"
            click_button "Save"

            page.should have_content("'A different owner' was successfully updated.")
            page.should have_no_content("A owner")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:space, :owner => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.spaces_admin_spaces_path

            click_link "Remove this space forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Spaces::Space.count.should == 0
          end
        end

      end
    end
  end
end

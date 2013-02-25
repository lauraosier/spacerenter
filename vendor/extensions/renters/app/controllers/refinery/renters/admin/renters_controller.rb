module Refinery
  module Renters
    module Admin
      class RentersController < ::Refinery::AdminController

        crudify :'refinery/renters/renter',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end

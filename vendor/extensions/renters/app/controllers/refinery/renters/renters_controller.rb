module Refinery
  module Renters
    class RentersController < ::ApplicationController

      before_filter :find_all_renters
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @renter in the line below:
        present(@page)
      end

      def show
        @renter = Renter.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @renter in the line below:
        present(@page)
      end

    protected

      def find_all_renters
        @renters = Renter.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/renters").first
      end

    end
  end
end

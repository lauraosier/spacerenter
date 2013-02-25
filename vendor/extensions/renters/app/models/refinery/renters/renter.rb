module Refinery
  module Renters
    class Renter < Refinery::Core::BaseModel
      self.table_name = 'refinery_renters'

      attr_accessible :name, :email, :phone, :bio, :photo_id, :position

      acts_as_indexed :fields => [:name, :email, :phone, :bio]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end

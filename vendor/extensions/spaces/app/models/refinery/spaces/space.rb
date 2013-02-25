module Refinery
  module Spaces
    class Space < Refinery::Core::BaseModel
      self.table_name = 'refinery_spaces'

      attr_accessible :owner, :address, :name, :phone, :hours, :email, :desription, :photo_id, :position

      acts_as_indexed :fields => [:owner, :address, :name, :phone, :hours, :email, :desription]

      validates :owner, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end

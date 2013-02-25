# This migration comes from refinery_renters (originally 1)
class CreateRentersRenters < ActiveRecord::Migration

  def up
    create_table :refinery_renters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :bio
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-renters"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/renters/renters"})
    end

    drop_table :refinery_renters

  end

end

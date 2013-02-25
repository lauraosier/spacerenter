class CreateSpacesSpaces < ActiveRecord::Migration

  def up
    create_table :refinery_spaces do |t|
      t.string :owner
      t.string :address
      t.string :name
      t.string :phone
      t.string :hours
      t.string :email
      t.text :desription
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-spaces"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/spaces/spaces"})
    end

    drop_table :refinery_spaces

  end

end

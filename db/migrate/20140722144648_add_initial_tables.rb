class AddInitialTables < ActiveRecord::Migration
  def change


    create_table :posts do |t|
      t.integer :category
      t.text :content
      t.integer :is_active
      t.text :excerpt 
      t.string :slug
      t.datetime :posted_date
      t.string :title
      t.timestamps
    end

    add_attachment :posts, :photo



    create_table :sliders do |t|
      t.text :caption
      t.integer :is_active
      t.timestamps
    end

    add_attachment :sliders, :photo


  end
end

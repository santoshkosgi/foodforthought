class CreateFooditems < ActiveRecord::Migration
  def change
    create_table :fooditems do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.text :description
      t.references :hotel

      t.timestamps
    end
    add_index :fooditems, :hotel_id
  end
end

class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :book_id, null:false
      t.string :reader

      t.timestamps
    end
  end
end

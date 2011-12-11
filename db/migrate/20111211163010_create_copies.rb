class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.integer :book_id, :null => false
      t.string  :index, :null => false
      t.string  :publication
      t.boolean :available, :default => true, :null => false
      t.timestamps
    end
  end
end

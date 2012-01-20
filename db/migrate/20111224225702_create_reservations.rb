class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :notes

      t.timestamps
    end
  end
end

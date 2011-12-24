class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date    :from
      t.date    :to
      t.date    :due
      t.integer :copy_id
      t.integer :book_id
      t.integer :user_id
      t.string  :notes

      t.timestamps
    end
  end
end

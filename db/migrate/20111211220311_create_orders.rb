class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date    :from
      t.date    :to
      t.date    :due
      t.string  :borrowers_name
      t.string  :borrowers_contact
      t.integer :copy_id
      t.string  :notes

      t.timestamps
    end
  end
end

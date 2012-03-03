class AddExistsToCopy < ActiveRecord::Migration
  def change
    add_column :copies, :exists, :boolean, :null => false, :default => true
  end
end

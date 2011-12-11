class RemoveNotNeededColumnsFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :index
    remove_column :books, :publication
  end

  def down
    add_column :books, :index, :string
    add_column :books, :publication, :string
  end
end

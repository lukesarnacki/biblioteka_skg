class ChangeBooksAndCategoryFieldsTypes < ActiveRecord::Migration
  def up
    change_column :books, :title,       :string
    change_column :books, :author,      :string
    change_column :books, :publication, :string
    change_column :books, :index,       :string
  end

  def down
    change_column :books, :title,       :text
    change_column :books, :author,      :text
    change_column :books, :publication, :text
    change_column :books, :index,       :text
  end
end

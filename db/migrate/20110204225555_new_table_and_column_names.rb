class NewTableAndColumnNames < ActiveRecord::Migration

  def self.up
    ActiveRecord::Base.table_name_prefix = ""
    rename_table :ksiazki, :library_books
    rename_table :kategorie, :library_categories

    rename_column :library_books, :tytul,     :title
    rename_column :library_books, :autor,     :author
    rename_column :library_books, :rok,       :publication
    rename_column :library_books, :indeks,    :index
    rename_column :library_books, :uwagi,     :details
    rename_column :library_books, :kategoria, :category_id

    rename_column :library_categories, :id_kat, :id
    rename_column :library_categories, :nazwa,  :name
    ActiveRecord::Base.table_name_prefix = "library_"
  end

  def self.down
    ActiveRecord::Base.table_name_prefix = ""
    rename_column :library_books, :title,       :tytul
    rename_column :library_books, :author,      :autor
    rename_column :library_books, :publication, :rok
    rename_column :library_books, :index,       :indeks
    rename_column :library_books, :details,     :uwagi
    rename_column :library_books, :category_id, :kategoria

    rename_column :library_categories, :id,   :id_kat
    rename_column :library_categories, :name, :nazwa

    rename_table :library_books,      :ksiazki
    rename_table :library_categories, :kategorie
    ActiveRecord::Base.table_name_prefix = "library_"
  end
end

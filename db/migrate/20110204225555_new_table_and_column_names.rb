class NewTableAndColumnNames < ActiveRecord::Migration

  # !!!
  # Be sure to perform this migration without
  # config.active_record.table_name_prefix = "library_"
  # line in application.rb

  def self.up
    rename_table :ksiazki, :library_books
    rename_table :kategorie, :library_categories

    rename_column :library_books, :tytul,     :title
    rename_column :library_books, :autor,     :author
    rename_column :library_books, :rok,       :edition
    rename_column :library_books, :indeks,    :index
    rename_column :library_books, :uwagi,     :details
    rename_column :library_books, :kategoria, :category_id

    rename_column :library_categories, :id_kat, :id
    rename_column :library_categories, :nazwa,  :name
  end

  def self.down
    rename_column :library_books, :title,       :tytul
    rename_column :library_books, :author,      :autor
    rename_column :library_books, :edition,     :rok
    rename_column :library_books, :index,       :indeks
    rename_column :library_books, :details,     :uwagi
    rename_column :library_books, :category_id, :kategoria

    rename_column :library_categories, :id,   :id_kat
    rename_column :library_categories, :name, :nazwa

    rename_table :library_books,      :ksiazki
    rename_table :library_categories, :kategorie
  end
end

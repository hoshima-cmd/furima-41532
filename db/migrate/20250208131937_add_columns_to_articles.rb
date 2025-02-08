class AddColumnsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :title, :string
    add_column :items, :text, :text
    add_column :items, :genre_id, :integer
  end
end

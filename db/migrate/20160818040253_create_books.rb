class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :image
      t.string :publication_date
      t.string :publisher
      t.string :synopsis

      t.timestamps null: false
    end
  end
end

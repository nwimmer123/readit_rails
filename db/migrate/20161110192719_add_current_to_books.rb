class AddCurrentToBooks < ActiveRecord::Migration
  def change
    add_column :books, :current, :integer
  end
end

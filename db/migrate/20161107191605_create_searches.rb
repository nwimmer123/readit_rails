class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.json :data

      t.timestamps null: false
    end
  end
end

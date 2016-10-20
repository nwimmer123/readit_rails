class CreateReviewHierarchies < ActiveRecord::Migration
  def change
    create_table :review_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :review_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "review_anc_desc_idx"

    add_index :review_hierarchies, [:descendant_id],
      name: "review_desc_idx"
  end
end

class AddParentIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :parent_id, :integer
  end
end
